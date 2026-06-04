Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1732CCD6E77
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JT3wp5vU+rH61I7tWcWaNxMDmUaIY7L/PuNEL1oa9NE=; b=ZdCvnTXkAj3sIE
	JFRibMnCNR5OONiONNFyFVu1Wa437ITV/j4x//A2+h6O7Oe/+0qSf0gw2j1CTturp+dqmNRnR0T+D
	Hn4hPVxfK4SG9khTFDZujOqUAU7qcvOS43kmDSo3mnQdaNpVMtYea1IIiPXLN39vGnPAp1w9s3cHg
	qpROa3atPdz5+4QpY6b8WGVxbxKhFaZDLikaY0cvgV1l+eYIj0+mI40ekOD6lJdR+TQtppRkNp1Zm
	HYPNytjPQp95LLxQ6P2UU/Wzn5vNVHQrYlgWAZV/xC6C5Hr3d1DgzWqXxrC7KidvEKcVCno8YyO6y
	85ETlQygzaMmrXuA2Sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV932-0000000Gtdo-3Rf0;
	Thu, 04 Jun 2026 14:27:52 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV930-0000000Gtbn-3cB4;
	Thu, 04 Jun 2026 14:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tj
	689IlmEzgN/OwsjvCidFFMdtb8D4N+RLJ0uDAjcqk=; b=TKWypmGBD5s4RSehnT
	1spSusSAa/MrK7xTnz14o44WoJsTovUPhk7Ke+sU3Wc1fASw+u3VWV+F/3ZXY+nq
	AV4KqsghDik3ht6EVBUCr183HzrhclsBDCdb7bAv96mD6d2P7akVxE8KoaCYvvgp
	tHTH5925AFYN3k+PenYk9jFoQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3VJAIiyFqSKmLAQ--.50067S2;
	Thu, 04 Jun 2026 22:26:18 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v2 0/2] KVM: riscv: Fix hugetlb G-stage block mapping eligibility
Date: Thu,  4 Jun 2026 22:26:00 +0800
Message-ID: <20260604142602.3582602-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgC3VJAIiyFqSKmLAQ--.50067S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw43Zr1Dtw15Cr48JF1fZwb_yoW8XF1xpa
	93Jw1Ygr95JFyaq3yxXw1ktr1fZw4rCa4UtryxGFZ8ArZxta4xKFsF9a47W3ykCrs3ZFZx
	ZFWYvrs8G3WUtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi5ku7UUUUU=
X-Originating-IP: [2408:823d:2011:21a8:b05b:a8f3:53a1:f680]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8grHQGohiwpQvgAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072751_361420_2D49EAE6 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

RISC-V KVM checks memslot alignment and head/tail coverage before
installing THP-backed PMD G-stage block mappings, but the hugetlb path
has used the hugetlb VMA size directly. That can be wrong for memslots
whose HVA and GPA have different offsets within the target block, or for
partial head/tail blocks.

Generalize the existing block eligibility helper so it can check a
caller-provided target size, use it to select hugetlb mappings with a
PUD -> PMD -> PAGE_SIZE fallback, and add a selftest mode that creates a
hugetlb memslot with a deliberate HVA/GPA offset mismatch.

Tested on a QEMU RISC-V host with 8 pre-allocated 2MB hugepages:

  # ./kvm_page_table_test -m 19 -s anonymous -b 4M -v 1
  # ./kvm_page_table_test -m 19 -s anonymous_hugetlb_2mb -b 4M -v 1
  # timeout 30s ./kvm_page_table_test \
        -m 19 -s anonymous_hugetlb_2mb -b 4M -v 1 -u

  base + selftest:
    anonymous:                 PASS
    aligned hugetlb:           PASS
    misaligned hugetlb:        timeout

  patched:
    anonymous:                 PASS
    aligned hugetlb:           PASS
    misaligned hugetlb:        PASS

v1 -> v2:
  - Squash the helper parameterization into the hugetlb fix
  - Use the ALIGN()/ALIGN_DOWN() form suggested by Nutty Liu and Anup
    for the memslot boundary check.

Jinyu Tang (2):
  KVM: riscv: Check hugetlb block mappings against memslot bounds
  KVM: selftests: Add a hugetlb memslot alignment test mode

 arch/riscv/kvm/mmu.c                          | 54 +++++++++++++++----
 .../selftests/kvm/kvm_page_table_test.c       | 28 +++++++---
 2 files changed, 66 insertions(+), 16 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
