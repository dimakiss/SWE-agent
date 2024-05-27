from typing import List

class Solution:
    def findProductsOfElements(self, queries: List[List[int]]) -> List[int]:
        def generate_big_nums(limit):
            big_nums = []
            i = 1
            while len(big_nums) < limit:
                x = i
                powers = []
                # Generate the powerful array for x
                while x > 0:
                    power = 1 << (x.bit_length() - 1)
                    powers.append(power)
                    x -= power
                big_nums.extend(powers[::-1])
                i += 1
            return big_nums

        # Main method to process queries
        def process_queries(queries, big_nums):
            results = []
            for from_idx, to_idx, mod in queries:
                product = 1
                for i in range(from_idx, to_idx + 1):
                    product = (product * big_nums[i]) % mod
                results.append(product)
            return results

        # Find the maximum index needed from queries to limit big_nums generation
        max_index = max(to for _, to, _ in queries)
        big_nums = generate_big_nums(max_index + 1)
        return process_queries(queries, big_nums)
# Test cases
sol = Solution()
print(sol.findProductsOfElements([[1, 3, 7], [2, 5, 3], [7, 7, 4]]))  # Expected output: [4, 2, 2]
