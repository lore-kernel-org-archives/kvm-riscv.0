Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C1C44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLEgEgdjdSMayiAJEXWTBRp17crL2PYrOIQP29VnbHI=; b=YIAY0zsKmA8A3j
	JJpoOZkfXK8gWdwQThdLgM7eBvVCHQEqVAAIDMskSNZIE0u3dVfvIKD6WHduyiEkRhWG4kCkBYr4W
	mRqTe3g+O/T1qcqDnYjH4UP6cUeNHZqho6nJAPao0mR8/ufSDFyQoVcF82RByXJA1rhfvvBIKto0Z
	uNHrldyTnPuYgiLzCBeQQZAng7ZSbum/5ZkVs/0zo12eQm05hQagNfxUwRGtOMc/9WpHRbu+lsFpp
	MN4+62tPAkcW/J69tm8BXz1Xi6SZ0CYrcp3CqqmiW5kGk0pOdQYvX1+iVQTVbB1dHuKpbGlXBU0lc
	Bhg8MiAXMZzLmI8KEi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvg-0000000CB8w-3kCy;
	Wed, 22 Jul 2026 15:32:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYve-0000000CB5h-2gx0;
	Wed, 22 Jul 2026 15:32:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC20168F;
	Wed, 22 Jul 2026 08:32:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6373F66F;
	Wed, 22 Jul 2026 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734333; bh=yIEI9TusozWN8JuTGtczFutPYB9cl2kOS5ZHqTwGcQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qRUJLFHgOJjrfi+0gOnSAAWEwPfJRGMmZiCR/0lSgWgMyzUOCyvBmFc1wrXlZGTug
	 +NmZavPY1FkNb5X9TeGnbtZD83EoZCYeskRRy4frc1M8Vh74wbAQwbXrcchc7SzpPG
	 EpZUSMLdn/NzjDMJMU42Do1Z9A6kSfv4QS/Zu/sk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:21 +0100
Subject: [PATCH RFC v2 13/20] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-13-d9e4bad31e0a@arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
In-Reply-To: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=JZD/Lbfbj4HSmqdnx7eUuD3cSDyNIRyRTYfHOiVHoYI=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIVinW6xJ66J0AtgWmoOBZtJI2fJu39cT+lG
 lmMvjqN7dmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFQAKCRBt1cPRWsUx
 MyCyDACle63B8F6HDqrCyaIvfxal1+c5g69sl4AqthRg5hNwvh6sb1rxEXQB/52AWeOXNH9P8sR
 aDlnR0TLzPJEldaqF746pWxMSKMrSydQ6xEWF3RWwa7WRkAZidtkw5heNBQGEHKzfWiwRW8gjAu
 k2gZi06lUIxph0Ng9HnPaoOHTQ8mVePaIzcmaQRlTrI4fjoHxddyfgzqqVtef+CYsvIFerrUzCY
 +TKNNtfkN3EqkPCNpDmA80f6fj4thl2/gTRaqCVex8in/rEy1PCid4f7edIoKlXUW7Ov7/vmN6s
 oSgu1pyEnnf+gjJZ2ZXc3YmrzRhoody2r0uJy76JCg3hjD2VTb6hw/uSFrO/spCd6Zyo2+Dl805
 ztdWGgHUEEuWsQn2ZOG9CNHwgwPSo0WuEfwGHlnD9Z2VEZ9n6XsBJEqTCnUnSCBO4O2DaefO8Ki
 jwe3YWiyFr3Zzq7G3qqDmUmmBm94H+C+l4mENG+3rFbDzXHuFtK+NWkNmEwmd/4ezLd50=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083214_796967_1690A448 
X-CRM114-Status: GOOD (  15.07  )
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

From: "David Hildenbrand (Arm)" <david@kernel.org>

The behaviour of pXdp_get() will change with generic compile-time folded
page tables. To prepare for that, rework effective_prot() to ignore any
folded page tables entries, as it will unconditionally get called by
ptdump core with pXd_val(pXdp_get()), and we really should be ignoring
that value for folded entries.

For this, introduce ptdump_pt_level_first() to identify the first real
page-table level and update effective_prot with higher_prot only
when the current entry is not folded nor the first level.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/dump_pagetables.c |  5 ++++-
 include/linux/ptdump.h        |  1 +
 mm/ptdump.c                   | 11 +++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2afa7a23340e..4e545988953a 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -27,6 +27,7 @@
  */
 struct pg_state {
 	struct ptdump_state ptdump;
+	int first_level;
 	int level;
 	pgprotval_t current_prot;
 	pgprotval_t effective_prot;
@@ -254,7 +255,7 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
 	pgprotval_t prot = val & PTE_FLAGS_MASK;
 	pgprotval_t effective;
 
-	if (level > 0) {
+	if (level > st->first_level) {
 		pgprotval_t higher_prot = st->prot_levels[level - 1];
 
 		effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
@@ -455,6 +456,8 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 		.seq		= m
 	};
 
+	st.first_level = ptdump_pt_level_first(mm);
+
 	ptdump_walk_pgd(&st.ptdump, mm, pgd);
 
 	if (!checkwx)
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 240bd3bff18d..26fa624eac44 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -29,6 +29,7 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 				struct mm_struct *mm, pgd_t *pgd,
 				bool checkwx, bool dmesg);
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd);
+int ptdump_pt_level_first(struct mm_struct *mm);
 bool ptdump_check_wx(void);
 
 static inline void debug_checkwx(void)
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 5851096e6f65..96676c90430f 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -197,6 +197,17 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	st->note_page_flush(st);
 }
 
+int ptdump_pt_level_first(struct mm_struct *mm)
+{
+	if (mm_pmd_folded(mm))
+		return 3;
+	if (mm_pud_folded(mm))
+		return 2;
+	if (mm_p4d_folded(mm))
+		return 1;
+	return 0;
+}
+
 static int check_wx_show(struct seq_file *m, void *v)
 {
 	if (ptdump_check_wx())

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
