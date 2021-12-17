From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 17 Dec 2021 15:51:14 +0100
Subject: Possible nohz-full/RCU issue in arm64 KVM
In-Reply-To: <YbyO40zDW/kvUHEE@FVFF77S0Q05N>
References: <d80e440375896f75d45e227d40af60ca7ba24ceb.camel@redhat.com>
 <YbyO40zDW/kvUHEE@FVFF77S0Q05N>
Message-ID: <ada9b2aa-f1e7-d566-0384-002890441a30@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/17/21 14:21, Mark Rutland wrote:
> I'm not immediately sure what we*should*  do here. What does x86 do for an IRQ
> taken from a guest mode? I couldn't spot any handling of that case, but I'm not
> familiar enough with the x86 exception model to know if I'm looking in the
> right place.

ARM is missing something like commit 160457140187 ("KVM: x86: Defer 
vtime accounting 'til after IRQ handling", 2021-05-05).

With that change, it would be possible to move guest_exit() in the 
irq-disabled region without breaking time accounting.

RISC-V has the same issue and it would be fixed in the same way, so 
let's Cc Anup too.

Paolo

