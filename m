Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A88CA5FED
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqxO6i2aOvZQvZ7PhoF/lXIEagFha6RGFSm37Zqu+T4=; b=ZKn3DPc1LV1ivu
	AR2qAWILv3HAilC4/ZXyP4Kif6LXB0i3eIGC4AbTnjj2JDrGE8K3QbtFUzXBRMkWDtuy1HEthZ8fM
	jQv/V8ehcb41zQRb6KDfzqa1NyslMRO0mzCAFEHbQcQXAH4+GUqRCemIx+npqEX1aDceBxPEd5q2t
	kRYbWkwzSLuvAvA8jf/8BgntIXre/c0P2afmyULHeKHI+bMD28LmXxYm3jZ+Q/b9aGC1b93yX79kH
	TceFNrLvpv2jBFx0UrX96Bg5yAhBje72fKAn1087OENTrs28yAtAtWLcscfEiaZs7tsYD7c8J2gLa
	boBCjb0aualncDK3ZhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2qw-0000000Dn3g-2nvg;
	Sat, 03 Oct 2026 16:44:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2qv-0000000Dn3S-0Knb;
	Sat, 03 Oct 2026 16:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FAB360D82;
	Sat,  3 Oct 2026 16:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3721F0089F;
	Sat,  3 Oct 2026 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791045888;
	bh=7yzjjlSzlbX51F4Uds4bBqm2u/xB0/1FIMGl/ApzD2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bx647l9+wLUh6qrW9IT0cVkSvcpibE7k5NC//4xJnC5NWtmeqV2VXyo7UBV38DtiW
	 dhWp3G8q7G1h+Ho+gC+INU5KH8XmH7gIPMRdvYEaBkasrJ+wC+4OzFSgyDZXh2vaCT
	 ohhNnG/zj5Qj4xaumqg2WECfL5q9zg9e0im1dnCNaVCcaoTe5h4tqf8C3MTYAVoscZ
	 PofZVfPz4yoGVwV/I2V/kOTucR2aMzQk4aQOLPsXA1kkuEcPj+eMMIEoiaeizShReT
	 DfPe0X2kZfZs0BxyY+cIUOGmRdszLgChSWuSEqIIwGgvCuNJNzz0ELbWMiwoHcQqIC
	 L181+b/9fkwVA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Sat, 03 Oct 2026 17:33:04 +0100
Subject: [PATCH v4 33/38] mm: eliminate VMA_SPECIAL_FLAGS usage when
 hugetlb explicitly tested
MIME-Version: 1.0
Message-Id: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-33-a1f052500fd7@kernel.org>
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586; i=ljs@kernel.org;
 h=from:subject:message-id; bh=VzpMBnGSH2RNHu5Mv4xiPliY+l+0YLYMpytCFKUc+Kk=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIO6umkilZK/M7+eTxUzWH/NiFVfePQS24fneXXPT9gn
 RzscvVARykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACai+5uR4fXvhwHn9v3S37ky
 7IVk7C/DklpjA5N52z4+O/bZWX1lfw7DX5n4P4YfA5z6v/yqOuFRKyvEk+n+SJ3/YvU0y0a9Ej4
 xBgA=
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

It is now an invariant that VMA_IO_BIT is not set by mm-managed mappings,
so each existing VMA_SPECIAL_FLAGS test need only test for
VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT and VMA_MIXEDMAP_BIT.

This is precisely a test for a fixed or non-mm-managed mapping.

Update a number of callsites which already explicitly handle hugetlb
mappings.

vma_supports_mlock() and ksm_compatible() also explicitly bail on droppable
mappings - excluding non-mm-managed, fixed or droppable mappings is exactly
what vma_is_mm_backed() tests for, so in these cases use this predicate.

should_skip_vma() tests for locked, fixed or non-mm-managed memory (having
already excluded hugetlb mappings) so simply test for those there.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/internal.h | 4 +---
 mm/ksm.c      | 4 +---
 mm/vmscan.c   | 3 ++-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index b5f7be8f65d8..e57c35e5f90b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1112,9 +1112,7 @@ static inline struct file *maybe_unlock_mmap_for_io(struct vm_fault *vmf,
 
 static inline bool vma_supports_mlock(const struct vm_area_struct *vma)
 {
-	if (vma_test_any_mask(vma, VMA_SPECIAL_FLAGS))
-		return false;
-	if (vma_test_single_mask(vma, VMA_DROPPABLE))
+	if (!vma_is_mm_backed(vma))
 		return false;
 	if (vma_is_dax(vma) || vma_is_hugetlb(vma))
 		return false;
diff --git a/mm/ksm.c b/mm/ksm.c
index 624f37975e12..ed66a90e0031 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -747,9 +747,7 @@ static bool ksm_compatible(const struct file *file, vma_flags_t vma_flags)
 	if (vma_flags_test_any(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT,
 			       VMA_HUGETLB_BIT))
 		return false;
-	if (vma_flags_test_single_mask(&vma_flags, VMA_DROPPABLE))
-		return false;
-	if (vma_flags_test_any_mask(&vma_flags, VMA_SPECIAL_FLAGS))
+	if (!vma_flags_is_mm_backed(&vma_flags))
 		return false;
 	if (file_is_dax(file))
 		return false;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 12ed3388ee41..3b318efa2916 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3477,7 +3477,8 @@ static int should_skip_vma(unsigned long start, unsigned long end, struct mm_wal
 	if (!vma_has_recency(vma))
 		return true;
 
-	if (vma->vm_flags & (VM_LOCKED | VM_SPECIAL))
+	if (vma_test(vma, VMA_LOCKED_BIT) || !vma_is_mm_managed(vma) ||
+	    vma_is_fixed_mapping(vma))
 		return true;
 
 	if (vma == get_gate_vma(vma->vm_mm))

-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
