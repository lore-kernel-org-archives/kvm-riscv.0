From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 19:30:56 +0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <87pmqy7ir2.wl-maz@kernel.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <87pmqy7ir2.wl-maz@kernel.org>
Message-ID: <bc51c15edf5b52b361998a922594db0bda726dad.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-11-17 at 18:13 +0000, Marc Zyngier wrote:
> What's the base for this series? This patch fails to compile for me
> (at least on arm64), and the following patch doesn't apply on -rc1.

It's on top of kvm/master, and it's also at
https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/xen-evtchn

git pull git://git.infradead.org/users/dwmw2/linux.git xen-evtchn
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211117/c017ea8c/attachment-0001.p7s>
