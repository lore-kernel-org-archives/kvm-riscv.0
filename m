From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 21 Feb 2023 10:51:13 +0000
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <Y/Sfpb2c/LS0LCiA@wendy>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy>
Message-ID: <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21 Feb 2023, at 10:40, Conor Dooley <conor.dooley@microchip.com> wrote:
> 
> Hey Christoph,
> 
> On Tue, Feb 21, 2023 at 08:12:58AM +0100, Christoph M?llner wrote:
>> Hi all,
>> 
>> The RISC-V Architectural Review Committee has discussed the concerns
>> regarding the non-ratified chapters in the AIA specification.
> 
> Thanks for the update!
> 
>> Here is the relevant quote from the meeting minutes:
>> """
>> Although the Advanced Interrupt Architecture (AIA) has already passed
>> Architecture Review (with a minor edit still pending), the committee
>> has some suggestions about its final steps to ratification, to avoid
>> the AIA document having a mixture of ratified and non-ratified content:
> 
>> - The AIA document's remaining draft chapter on the Duo-PLIC, which is
>>  not currently on a path to ratification, can be removed to a separate
>>  document.
> 
> That sounds promising...
> 
>> - Ratification of the full AIA (without Duo-PLIC) can be postponed to
>>  coincide with ratification of the IOMMU specification, given that
>>  the latter is now expected in a reasonable time, and the AIA's last
>>  chapter concerning IOMMUs is already scheduled to go through public
>>  review and be ratified only together with the IOMMU specification.
>> """
> 
> ...and so does this. AIA stuff's acceptability only depending on the
> IOMMU spec's freeze (and thus Chapter 9's) seems like a vast improvement
> on the status quo to me!
> 
>> The full meeting minutes can be found here:
>>  https://lists.riscv.org/g/tech-chairs/message/1381
> 
> This link is non functional unfortunately :/

tech-chairs is private, for (co-)chairs only... not sure why it went
there rather than tech-privileged.

Jess

> Cheers,
> Conor.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


