From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 13:22:19 -0500
Subject: [PATCH 26/44] KVM: s390: Mark __kvm_s390_init() and its
 descendants as __init
In-Reply-To: <20221102231911.3107438-27-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-27-seanjc@google.com>
Message-ID: <fb45be96446d9d66272eafe284863f80bac8af45.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Tag __kvm_s390_init() and its unique helpers as __init.? These
> functions
> are only ever called during module_init(), but could not be tagged
> accordingly while they were invoked from the common kvm_arch_init(),
> which is not __init because of x86.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/s390/kvm/interrupt.c | 2 +-
> ?arch/s390/kvm/kvm-s390.c? | 4 ++--
> ?arch/s390/kvm/kvm-s390.h? | 2 +-
> ?arch/s390/kvm/pci.c?????? | 2 +-
> ?arch/s390/kvm/pci.h?????? | 2 +-
> ?5 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

