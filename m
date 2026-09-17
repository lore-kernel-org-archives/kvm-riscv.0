Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA4C88E72
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOEWiFJGjoFlkaWMHD380SEootaWWQrkdNKsq+oREl0=; b=tb0e9sQAJtZJXk
	ziaGkzOBkLcMTEQ9Y90LTSWbK0IvkTfOnCUB4lESjk4njSLRF1JbOHqT+IkjdXVVXrEgzKzob63Iv
	HtyfXTKqbdaQpdnGR9mfozrzQi0r6IiZFKkaVUgL96qVh2leYBmAv2Zg5ZwVbXmxEPRWHXceslE6e
	q1vz7cHCKfhmlpSy5aPltbDitQC74MwLLsZp9o0U8+VFzaeiaDNQ3TuGVVdGrzdkVmVQCpKmmp7v1
	yveuTufYPBZcZsrfZLF5jnJkC560XGpD1+Lj/AQZ5xywcB1smX02qlXNDde9yKfgLzGhJ+8QLtzRf
	SAWWdSqONyNf8pG+CqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EvX-0000000Bt9D-1mqQ;
	Thu, 17 Sep 2026 16:25:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EvW-0000000Bt8V-01re;
	Thu, 17 Sep 2026 16:25:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DBC741859;
	Thu, 17 Sep 2026 16:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC121F000FF;
	Thu, 17 Sep 2026 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789662333;
	bh=8zUDlDajoLo9shAT2eWSvXFFt1x2wdqtDjriRhbNo6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jIIfr1dY5Y6yUBVPzpQtob/6PKGQ/KkiAaN6tkH5dtYIPaU7u+htS8ArcPnlhxaXJ
	 tHJxyzcbqBjgQKUa5UQC/IT790lvfATEygmgoPx7gBSUiC+4ji4Wdp5mMVNWM0NoKy
	 zHyuAFujuXmFR50iBT3C5hJroCfuXBIuwkbhitV02qQcKqrUlJL/eEMPl+CANyccwK
	 k3ZV7wtR7pyYo7QLyuI8SNULhv2ot0z9DARSve+y4UekG4p3Ycjuj9H/20kPMpU8Kf
	 GZT0O8zTdiTinqgWKO98a5x1Yug3NZ/9GWFi/Xgm1t6SuLqfQcS0Hm6Rr7uLRHz024
	 UwI4k4J7cE4kg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 17 Sep 2026 17:22:14 +0100
Subject: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
MIME-Version: 1.0
Message-Id: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-rdma@vger.kernel.org, selinux@vger.kernel.org, 
 linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
 fuse-devel@lists.linux.dev, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=ljs@kernel.org;
 h=from:subject:message-id; bh=w3dS+6CYztzIjEhtJt3yaqv3CXCLNku1+RXavwrSev0=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLWCO+/vHnCoy+HuE5fLHlRPt1qp8T64Jl/V1y40DHtZ
 fPTiz+sfTpKWRjEuBhkxRRZnn8R3x8kEjav84K/G8wcViaQIQxcnAIwkdvqjAwzQ1Ljhcx4prrN
 2n3L8vw+PsttEWszl93ZWrDtX9Xr5IQEhn9qfvO3fuXmu6sYzP07MHhLa0rMgWMfLvX5KTQF1Jp
 8OMgDAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

When a user requests an mmap_action be performed in mmap_prepare, this
involves populating the VMA range with data.

However, if the VMA is mergeable, it might then mistakenly be merged with
another VMA without having populated the range.

Every mmap action currently available sets VMA flags such that the VMA
cannot be merged.

However, to ensure that no future mmap action falls foul of this, assert
that this is the case upon mmap_prepare validation.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/vma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/vma.c b/mm/vma.c
index d6ed10cefc8f..62f2ce1ad5a1 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2809,6 +2809,15 @@ static int mmap_validate(unsigned long prev_start, unsigned long prev_end,
 int mmap_prepare_validate(const struct vm_area_desc *prev_desc,
 			  const struct vm_area_desc *desc)
 {
+	/*
+	 * It is not valid to execute mmap actions for VMAs which can be merged,
+	 * as any such merge would leave portions of the mapping incorrectly
+	 * unmapped.
+	 */
+	if (vma_flags_can_merge(&desc->vma_flags) &&
+	    WARN_ON_ONCE(desc->action.type != MMAP_NOTHING))
+		return -EINVAL;
+
 	return mmap_validate(prev_desc->start, prev_desc->end,
 			     desc->start, desc->end,
 			     &prev_desc->vma_flags, &desc->vma_flags);

-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
