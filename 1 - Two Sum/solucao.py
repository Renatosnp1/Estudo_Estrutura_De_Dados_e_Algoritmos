from typing import List

class Solution1:

    def twoSum(self, nums: List[int], target: int) -> List[int]:

        for i in range(len(nums)):
            dieferenca = target - nums[i] #Verifco a diferença entre o target e o numero atual

            if dieferenca in nums[i+1:]: #Verifico se a diferença está na lista
                return [i, nums[i+1:].index(dieferenca ) + i + 1] #Retorno o indice do numero atual e o indice da diferença



print(Solution1().twoSum(nums=[3,2,4], target=6))