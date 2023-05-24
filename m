From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 May 2023 08:32:27 +0200
Subject: [PATCH -next v20 12/26] riscv: Add ptrace vector support
In-Reply-To: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
References: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
Message-ID: <eb61b8c5-4c0a-4d64-b817-235db848995c@app.fastmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 24, 2023, at 02:49, Palmer Dabbelt wrote:
> On Thu, 18 May 2023 09:19:35 PDT (-0700), andy.chiu at sifive.com wrote:

>>  static const struct user_regset_view riscv_user_native_view = {
>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>> index ac3da855fb19..7d8d9ae36615 100644
>> --- a/include/uapi/linux/elf.h
>> +++ b/include/uapi/linux/elf.h
>> @@ -440,6 +440,7 @@ typedef struct elf64_shdr {
>>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
>
> IIUC we're OK to define note types here, as they're all sub-types of the 
> "LINUX" note as per the comment?  I'm not entirely sure, though.
>
> Maybe Arnd knows?

No idea. It looks like glibc has the master copy of this file[1], and
they pull in changes from the kernel version, so it's probably fine,
but I don't know if that's the way it's intended to go.

     Arnd

[1] https://sourceware.org/git/?p=glibc.git;a=history;f=elf/elf.h

