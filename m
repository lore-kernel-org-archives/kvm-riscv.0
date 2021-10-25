From: Sean Christopherson <seanjc@google.com>
Date: Mon, 25 Oct 2021 15:48:24 +0000
Subject: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running
 on vCPU load (with APICv)
In-Reply-To: <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-38-seanjc@google.com>
 <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
Message-ID: <YXbRyMQgMpHVQa3G@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > +	/* TODO: Document why the unblocking path checks for updates. */
> 
> Is that a riddle or what? :)

Yes?  I haven't been able to figure out why the unblocking path explicitly
checks and handles an APICv update.

