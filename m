From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 08 Dec 2022 20:33:09 -0800 (PST)
Subject: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
In-Reply-To: <CAOnJCUJ6b5=e=k19q0Q51Gptgw_QSr_989cN8q0xoBN+yq=Mmw@mail.gmail.com>
Message-ID: <mhng-1fa7f552-95e4-4299-ab83-52001eab8b30@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 28 Nov 2022 13:07:27 PST (-0800), atishp at atishpatra.org wrote:
> On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
>> can be used by KVM module so let us export these functions.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  arch/riscv/kernel/sbi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 775d3322b422..5c87db8fdff2 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
>>
>>  long sbi_get_marchid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_marchid);
>>
>>  long sbi_get_mimpid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>>
>>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>>  {
>> --
>> 2.34.1
>>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

