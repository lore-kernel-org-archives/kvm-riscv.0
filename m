Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD07C982ED
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSVivaqo7Q+lUF4t6N4QELAMrfQdpPYA8cQz5FFUniE=; b=tffrOYQ/ch1HE0
	jiRn3Imgzo+0B1GkUE5FKuft6q/J2yDEXaZy6WMMnG4q7BH+W2TOH15cCp09EajtjilDtwk8p45R1
	LZT5J69ziI0TiQECKhwvLHlBop4UK5NapNR3G4KaAOrWy1J1v/cII90ewY2yNeCmvqUCrTxxhD571
	06fARadB/fAG/Tk6eCin8Ttiv2Npq0zvIm1R1+ab/4psuVk8l4GYKDKZysojOXtuxYPwxkFAdHjAo
	GzuvE3MRsD0p3cKPfjT/uWNxGWoSFWdkZ+IC8PWrtDSvfpyMQ3vV07zfALq5B1G6/HWt9runumFNm
	+3xmC8evPr+i3qzlFm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bjm-00000001nWS-3yUe;
	Mon, 21 Sep 2026 10:59:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bjd-00000001nO7-199K;
	Mon, 21 Sep 2026 10:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r03SVNisaJd6Dqlau4jEcL3AHt7KSVLlnibo546VQzE=; b=fByShNc6OErlLMef9Y5gOaeyC8
	21zbyj3/almhfHXylhX7kqQmSuVilvG0GxnTCQr5oL6zj6tZxsU5D0owwEnV/D2ZG+Ea2yvR61oIS
	ndHzuYnVYtGo1nlHtmWqGPnRrPWaIJv+P5qu26awDnQLYbZYHAcpbZKVPSY4a+W/OD3LhOaGbtUSJ
	vLxWrsHA1a4HEdhH6+38OFGUJGk1bGCRY07QLDmYEmJJ1XwdYRL59uuqit96F/wSuL0mAFlP6un9s
	j9/tPpRSbxBKPr/a1MKhN9gFSCL2AZEqpMkdRuC7s3EM82GwRev0zEx3H8NF3IqflZXgRKqCCnKjd
	X643ng1g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bjZ-0000000C9gL-387K;
	Mon, 21 Sep 2026 10:58:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57631CE0;
	Mon, 21 Sep 2026 03:58:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12E133F86C;
	Mon, 21 Sep 2026 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988332; bh=dSuJLJ9ohCs7txtQHt7hy5Mg9PfzhT9ZTRhsbp3QTUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BThdboLwJgWaXYoH9hZWEZBjiZRv2Fu3SH7AMV949zk04FGwQM/S7e44T41HHFqBc
	 ig0U/2EjLwcRsv+kn9RsCmeVGvHrzU+JMOsKwYzE5TaT0Ma5zFoMq0vE69LvCBaH9/
	 4ET22UaBocVm3SCd1ar8dSE+dmzg+C2+T55N2vcs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:41 +0100
Subject: [PATCH 19/21] mm/pgtable: disallow calling (pgd|p4d|pud)_page,
 pgd_page_vaddr() and (p4d|pud)_pgtable with dummy
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-19-cd40cf68242e@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3268; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=VRD/vI2+dr2wFISWOiD6XpoJffv8Fhm2BOtCv803wXw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1Tk7kRq4iKLtEgxpTwxLYomoYS7bs7Di2hM
 iOcaArqGTSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENUwAKCRBt1cPRWsUx
 M0sKC/9fNwlXps/S5pQLQVmMhjhsVPzMbJGpnIoLHcK+XvcblaBizi3oEaugKCqA4IADURZxi7N
 zeU9amkUNdxMyAtLqtqsPRdxMSu+j3HYk690xsRuu/io3DcfvB5D0j/q9hCj04SJ9Bh6IUiV17O
 gNPS5GYZCwInYoilXG5e+HDU5w+XUwHoO+31YrveczOJESkUQ629XwSLUYzTZszK4UTHSe8eHN7
 WpArw7F0ghyhriT0dILPWFsphGS9NifdWOc2+ZQ/1vOfre04d8kJHQb36FIwB6SFR7yI/luwSuw
 5RS5NpbJ58nx0AUey7RNro8jvW+HJmYnG9NO6ooeCMeXaKWbwC0g4p0lpKTUN6ZFzwon0SGwno3
 YUiLEt32U5HAd7gBIVuvVL/IZo0r+8jfF97cQKOV05fH01cS47H2K1DIwwEQt7PMkVszvEnPgEU
 pitE91INdVgJpvsLhPH3gte8+ox1sUn6LlA7pzFKeTV7DYzVwjulFjYbnWcQM6VW58Nd8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115854_208474_71D9B3B4 
X-CRM114-Status: GOOD (  11.14  )
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

These helpers silently fallback to the folded helpers. With e.g., pdgp_get()
returning dummy values, pgd_page_vaddr(pgdp_get(pgdp)) will now behave
differently than pgd_page_vaddr(*pgdp).

Disallow calling (pgd|p4d|pud)_page() entirely, and catch when passing a
dummy value to pgd_page_vaddr() and (p4d|pud)_pgtable.
This will catch most abuse of dummy pXdp value at compile time --
so far there were none, and it better stay that way.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Co-developed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/asm-generic/pgtable-nop4d.h | 8 ++++++--
 include/asm-generic/pgtable-nopmd.h | 8 ++++++--
 include/asm-generic/pgtable-nopud.h | 8 ++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 2d86325235da5..d2dccf7542da5 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -70,8 +70,12 @@ static __always_inline p4d_t *__p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
 #define p4d_val(x)				(pgd_val((x).pgd))
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
-#define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			((unsigned long)(p4d_pgtable((p4d_t){ pgd })))
+#define pgd_page(pgd)				({ BUILD_BUG(); (struct page *)NULL; })
+#define pgd_page_vaddr(pgd)						\
+({ 									\
+	pgd_check_dummy(pgd);						\
+	(unsigned long)p4d_pgtable((p4d_t) { pgd });			\
+})
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index bd40d3a5743ff..2afbf2d8659dc 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -79,8 +79,12 @@ static __always_inline pmd_t *__pmd_offset_lockless(pud_t *pudp, pud_t pud,
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
 
-#define pud_page(pud)				(pmd_page((pmd_t){ pud }))
-#define pud_pgtable(pud)			((pmd_t *)(pmd_page_vaddr((pmd_t){ pud })))
+#define pud_page(pud)				({ BUILD_BUG(); (struct page *)NULL; })
+#define pud_pgtable(pud)						\
+({									\
+	pud_check_dummy(pud);						\
+	((pmd_t *)(pmd_page_vaddr((pmd_t) { pud })));			\
+})
 
 /*
  * allocating and freeing a pmd is trivial: the 1-entry pmd is
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 7475d0bd0f2e0..3264673c0c386 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -77,8 +77,12 @@ static __always_inline pud_t *__pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
 #define pud_val(x)				(p4d_val((x).p4d))
 #define __pud(x)				((pud_t) { __p4d(x) })
 
-#define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_pgtable(p4d)			((pud_t *)(pud_pgtable((pud_t){ p4d })))
+#define p4d_page(p4d)				({ BUILD_BUG(); (struct page *)NULL; })
+#define p4d_pgtable(p4d)						\
+({									\
+	p4d_check_dummy(p4d);						\
+	((pud_t *)(pud_pgtable((pud_t) { p4d })));			\
+})
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
