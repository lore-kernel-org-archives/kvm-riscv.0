From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Fri, 03 Jun 2022 14:20:15 -0700 (PDT)
Subject: (RISC-V KVM) Re: [PATCH] RISC-V: fix typos in comments
In-Reply-To: <CAAhSdy3+imWabbArUAg0Bki3qvD1PGVB-L-xY5CvNa_YBu80aA@mail.gmail.com>
Message-ID: <mhng-90fa273a-b4b0-4078-887b-5e4f58986006@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 02 Jun 2022 21:33:00 PDT (-0700), anup at brainfault.org wrote:
> On Thu, Jun 2, 2022 at 9:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Sat, 30 Apr 2022 12:11:20 PDT (-0700), Julia.Lawall at inria.fr wrote:
>> > Various spelling mistakes in comments.
>> > Detected with the help of Coccinelle.
>> >
>> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>> >
>> > ---
>> >  arch/riscv/kvm/vmid.c |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
>> > index 2fa4f7b1813d..4a2178c60b5d 100644
>> > --- a/arch/riscv/kvm/vmid.c
>> > +++ b/arch/riscv/kvm/vmid.c
>> > @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>> >                * We ran out of VMIDs so we increment vmid_version and
>> >                * start assigning VMIDs from 1.
>> >                *
>> > -              * This also means existing VMIDs assignement to all Guest
>> > +              * This also means existing VMIDs assignment to all Guest
>> >                * instances is invalid and we have force VMID re-assignement
>> >                * for all Guest instances. The Guest instances that were not
>> >                * running will automatically pick-up new VMIDs because will
>>
>> Anup: I'm guessing you didn't see this because it didn't have KVM in the
>> subject?
>>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> if that helps any, I don't see in anywhere but not sure if I'm just
>> missing it.
>
> Thanks Palmer, I had already planned to pick this as a RC fix for 5.19
> but I forgot to reply here.

OK, no worries.  I was't going to do anything with it as it's 
arch/riscv/kvm, so no rush on my end.

