From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 12:57:17 -0500
Subject: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init()
 piece-by-piece() if a step fails
In-Reply-To: <20221102231911.3107438-6-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-6-seanjc@google.com>
Message-ID: <1386ccd1ff60cb8e4af80fbb294160a8d7cc3b5b.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> In preparation for folding kvm_arch_hardware_setup() into
> kvm_arch_init(),
> unwind initialization one step at a time instead of simply calling
> kvm_arch_exit().? Using kvm_arch_exit() regardless of which
> initialization
> step failed relies on all affected state playing nice with being
> undone
> even if said state wasn't first setup.? That holds true for state
> that is
> currently configured by kvm_arch_init(), but not for state that's
> handled
> by kvm_arch_hardware_setup(), e.g. calling
> gmap_unregister_pte_notifier()
> without first registering a notifier would result in list corruption
> due
> to attempting to delete an entry that was never added to the list.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
> ?1 file changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

