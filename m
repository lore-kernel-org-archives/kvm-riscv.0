From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 11:30:18 -0800
Subject: [PATCH v3 03/14] RISC-V: Improve SBI PMU extension related definitions
In-Reply-To: <Y9RV0cOMld20EFBI@spud>
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-4-atishp@rivosinc.com>
 <Y9RV0cOMld20EFBI@spud>
Message-ID: <CAOnJCU+16EEe0OrNY3ZW_FS591+KmG5ap1OTjOL+gtqGtr7nLw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 2:53 PM Conor Dooley <conor@kernel.org> wrote:
>
> Yo Atish,
>
> On Fri, Jan 27, 2023 at 10:25:47AM -0800, Atish Patra wrote:
> > This patch fixes/improve few minor things in SBI PMU extension
> > definition.
> >
> > 1. Align all the firmware event names.
>
> > @@ -171,7 +171,7 @@ enum sbi_pmu_fw_generic_events_t {
> >       SBI_PMU_FW_IPI_RECVD            = 7,
> > -     SBI_PMU_FW_FENCE_I_RECVD        = 9,
> > +     SBI_PMU_FW_FENCE_I_RCVD         = 9,
> >       SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
>
> Alignment looks incomplete to me! Looks like you went from 2 RECVD and
> 1 RCVD to 2 RCVD and 1 RECVD! FWIW, the spec uses RECEIVED for all of

Ahh I missed the other one. I have changed everything to RCVD just to
keep it short.
"RECEIVED" is too long :)


> these:
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#114-event-firmware-events-type-15
>
> Thanks,
> Conor.
>


-- 
Regards,
Atish

