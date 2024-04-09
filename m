From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 8 Apr 2024 17:21:53 -0700
Subject: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
In-Reply-To: <20240404-bbfb02e3aec944f9e11745ae@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
 <20240404-bbfb02e3aec944f9e11745ae@orel>
Message-ID: <c33b4da9-5759-4a1a-844d-c6dbad028d12@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/4/24 05:01, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
> ...
>> +static int pmu_sbi_snapshot_disable(void)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
>> +			-1, 0, 0, 0, 0);
> 
> The "Rename the SBI_STA_SHMEM_DISABLE" patch should come before this
> patch so SBI_SHMEM_DISABLE can be used instead of the -1's here.
> 

Sure. Done.

> Thanks,
> drew


