From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Dec 2021 18:58:18 +0100
Subject: [PATCH v5 03/12] KVM: s390: Use Makefile.kvm for common files
In-Reply-To: <20211121125451.9489-4-dwmw2@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-4-dwmw2@infradead.org>
Message-ID: <5549294a-b411-1279-dcd0-3977c19c928e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/21/21 13:54, David Woodhouse wrote:
>   
> -kvm-objs := $(common-objs) kvm-s390.o intercept.o interrupt.o priv.o sigp.o
> +kvm-objs := kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-objs += diag.o gaccess.o guestdbg.o vsie.o pv.o

"kvm-y +=" here (for both lines) would be nicer, it's consistent with 
x86 and avoids the question of what happens if you have both kvm-objs 
and kvm-y.

Paolo

