Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36BCCD5BAA
	for <kvm-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAidAUkd149oak0IRoT2DFRhuedMWF5mLZiHIo9qC28=; b=1i7t0Pt9fY8t9u
	8qBAvM5j11LY7Hb7fBTtFp9rsG4JBFJDELEOvJrQLfeH3t22rLjl9qoLq/6sUfKNuGNgKyceAzPqu
	eDdldq9E2WMAkmmkhaytdotTQv63jCeXhkrl9KLm70znZ47spII9+0pXHFu6ucmJ7V9UxjBMiWMxg
	Bulr4EKCM023xBeDb65U30kMOe6ZZ3BP2CKBltLYS9nwQHYh7zYNbNeaTkurycD2QpzzzcrI6sHwI
	MOTYrYQqMwPKppaiPLxkTphQkxsFgq43oL/w+aUxTBEzgm5I1628/rHRYhsO9aGvYkgngj5K7I6+d
	0vWPfAWhXcjLDPCbCeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilk-00000004y9U-2gCA;
	Wed, 20 May 2026 15:23:36 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilh-00000004y6p-2m6c;
	Wed, 20 May 2026 15:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rz
	Etfaoq3iNg6WDH8LoFIArzXVhWsn/xtEQAKiEIad4=; b=UR+/10CtKYy8se4CIT
	ANqE9Xc3xwKDE5WpgPg0gtxVROEYpZOrtUxlVhYewkXlEkMRMZmWqQnROmfUNSBf
	Fgbv51SUVJrfZNAgEiwHJCIB9uTDRkkzmOeU/sq2I9PorgA4kZGBmMSEzvqcE5av
	x5suk2OLRM+/NKurqiVDWtPqs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnt1md0Q1qGHMGCg--.33359S2;
	Wed, 20 May 2026 23:22:06 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm <kvm@vger.kernel.org>,
	kvm-riscv <kvm-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 0/3] KVM: riscv: Fix hugetlb G-stage block mapping eligibility
Date: Wed, 20 May 2026 23:21:45 +0800
Message-ID: <20260520152148.131272-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wAnt1md0Q1qGHMGCg--.33359S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF48CF4UZw1DAry3Zry8AFb_yoWfKrX_CF
	yrKr93Jw48uFyqkFWDtw48KrZ8G3y0yr9rZF4DZwnrWryj9F4DuFnYvFyI9r18Way3uwnx
	Cr17Ga409w1q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKUDGUUUUUU==
X-Originating-IP: [2408:823d:2011:b54:c309:80a7:694d:2e40]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8R558WoN0Z4MrAAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082334_088958_33AA1F77 
X-CRM114-Status: UNSURE (   6.36  )
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

Jinyu Tang (3):
  KVM: riscv: Pass the target size to huge G-stage checks
  KVM: riscv: Check hugetlb block mappings against memslot bounds
  KVM: selftests: Add a hugetlb memslot alignment test mode

 arch/riscv/kvm/mmu.c                          | 53 +++++++++++++++----
 .../selftests/kvm/kvm_page_table_test.c       | 28 +++++++---
 2 files changed, 65 insertions(+), 16 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
