From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Nov 2022 16:50:32 +0000
Subject: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
In-Reply-To: <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-33-seanjc@google.com>
 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
Message-ID: <Y20r2NR9MaBbOGLn@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 10, 2022, Robert Hoo wrote:
> After this patch set, still find some printk()s left in arch/x86/kvm/*,
> consider clean all of them up?

Hmm, yeah, I suppose at this point it makes sense to tack on a patch to clean
them up.

