From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Oct 2021 16:57:00 +0200
Subject: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
In-Reply-To: <YXllGfrjPX1pVUx6@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
 <YXllGfrjPX1pVUx6@google.com>
Message-ID: <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/10/21 16:41, Sean Christopherson wrote:
> The other thing I don't like about having the WARN in the loop is that it suggests
> that something other than the vCPU can modify the NDST and SN fields, which is
> wrong and confusing (for me).

Yeah, I can agree with that.  Can you add it in a comment above the 
cmpxchg loop, it can be as simple as

	/* The processor can set ON concurrently.  */

when you respin patch 21 and the rest of the series?

Paolo


