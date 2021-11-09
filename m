From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:38:47 +0100
Subject: [PATCH v5.5 05/30] KVM: Resync only arch fields when
 slots_arch_lock gets reacquired
In-Reply-To: <20211104002531.1176691-6-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-6-seanjc@google.com>
Message-ID: <aae78856-6a7b-6812-029a-32ddb6ad6866@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 
> There is no need to copy the whole memslot data after releasing
> slots_arch_lock for a moment to install temporary memslots copy in
> kvm_set_memslot() since this lock only protects the arch field of each
> memslot.
> 
> Just resync this particular field after reacquiring slots_arch_lock.
> 
> Note, this also eliminates the need to manually clear the INVALID flag
> when restoring memslots; the "setting" of the INVALID flag was an
> unwanted side effect of copying the entire memslots.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> [sean: tweak shortlog, note INVALID flag in changelog, revert comment]

This updated patch also open-codes kvm_copy_memslots(), which my
previous version didn't.
I think it's worth mentioning this in the change log, too.

Thanks,
Maciej

