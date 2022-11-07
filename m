From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 13:22:11 -0500
Subject: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-26-seanjc@google.com>
Message-ID: <e2b21ebfec94bcc3d830a5c7f11837d6dedac652.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Move the guts of kvm_arch_init() into a new helper,
> __kvm_s390_init(),
> and invoke the new helper directly from kvm_s390_init() instead of
> bouncing through kvm_init().? Invoking kvm_arch_init() is the very
> first action performed by kvm_init(), i.e. this is a glorified nop.
> 
> Moving setup to __kvm_s390_init() will allow tagging more functions
> as
> __init, and emptying kvm_arch_init() will allow dropping the hook
> entirely once all architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
> ?1 file changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>


