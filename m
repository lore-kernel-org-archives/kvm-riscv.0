From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 12:56:51 -0500
Subject: [PATCH 04/44] KVM: Teardown VFIO ops earlier in kvm_exit()
In-Reply-To: <20221102231911.3107438-5-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-5-seanjc@google.com>
Message-ID: <5e44854b2781a0be6fae5c82645ac64ef9b5dccf.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Move the call to kvm_vfio_ops_exit() further up kvm_exit() to try and
> bring some amount of symmetry to the setup order in kvm_init(), and
> more
> importantly so that the arch hooks are invoked dead last by
> kvm_exit().
> This will allow arch code to move away from the arch hooks without
> any
> change in ordering between arch code and common code in kvm_exit().
> 
> That kvm_vfio_ops_exit() is called last appears to be 100%
> arbitrary.? It
> was bolted on after the fact by commit 571ee1b68598 ("kvm: vfio: fix
> unregister kvm_device_ops of vfio").? The nullified
> kvm_device_ops_table
> is also local to kvm_main.c and is used only when there are active
> VMs,
> so unless arch code is doing something truly bizarre, nullifying the
> table earlier in kvm_exit() is little more than a nop.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?virt/kvm/kvm_main.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

