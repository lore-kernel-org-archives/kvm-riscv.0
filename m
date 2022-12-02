From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 2 Dec 2022 13:06:56 +0000
Subject: [PATCH v2 41/50] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
In-Reply-To: <20221130230934.1014142-42-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-42-seanjc@google.com>
Message-ID: <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
...

> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Perhaps I am wrong, but I have memory that if someone has SoB but isn't the
original author should also have a Co-developed-by?

> Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> [sean: drop WARN that IRQs are disabled]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

