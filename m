From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 31 Jul 2023 17:58:08 +0200
Subject: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZMRXVZYaJ9wojGtS@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com> <ZMOJgnyzzUNIx+Tn@google.com>
 <ZMRXVZYaJ9wojGtS@google.com>
Message-ID: <eb356cf1-c661-930b-2175-427a59267d1f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/29/23 02:03, Sean Christopherson wrote:
> KVM would need to do multiple uaccess reads, but that's not a big
> deal.  Am I missing something, or did past us just get too clever and
> miss the obvious solution?

You would have to introduce struct kvm_userspace_memory_region2 anyway, 
though not a new ioctl, for two reasons:

1) the current size of the struct is part of the userspace API via the 
KVM_SET_USER_MEMORY_REGION #define, so introducing a new struct is the 
easiest way to preserve this

2) the struct can (at least theoretically) enter the ABI of a shared 
library, and such mismatches are really hard to detect and resolve.  So 
it's better to add the padding to a new struct, and keep struct 
kvm_userspace_memory_region backwards-compatible.


As to whether we should introduce a new ioctl: doing so makes 
KVM_SET_USER_MEMORY_REGION's detection of bad flags a bit more robust; 
it's not like we cannot introduce new flags at all, of course, but 
having out-of-bounds reads as a side effect of new flags is a bit nasty. 
  Protecting programs from their own bugs gets into diminishing returns 
very quickly, but introducing a new ioctl can make exploits a bit harder 
when struct kvm_userspace_memory_region is on the stack and adjacent to 
an attacker-controlled location.

Paolo


