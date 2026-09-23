Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D16C982FA
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAWLOlzeRfOE5sj/QemlcMj3NaAJIVsDzyW72Uxao28=; b=qgeRUqDRn37Lor
	8oo1rDrIacw65uG6gR6JJRYjWVsf3nUa8kMzFjfyvhxqnRIJKIzV6mR8qd6fKLueFIfQB33S15v13
	DRrCbfG3SPiDhR9+mRtudld9Hca1mUAOwoGjosGLl2EGQy6qkFI0dOtAmVKbntY22z7K5GJ5NRnRI
	o1FPY8caPGWaOM/1uciQPY4DKRyxA7BHiDsWTaLdRO8DUnObcgVpiFbAdirl5VXSYEAHgS18yzBWD
	ubTPizlbE3jM5ZcnTVagwUFf1qNJ2n+8/WpCUNTw9TotJmjZ3xxQqUoAAUDdfep2hniPFfNp/stl/
	qAAvQ0RH8WHc8M+SLzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Inf-00000007d9w-1HI8;
	Wed, 23 Sep 2026 08:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ind-00000007d9E-3m3f;
	Wed, 23 Sep 2026 08:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97EDE43790;
	Wed, 23 Sep 2026 08:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D981F000FF;
	Wed, 23 Sep 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153877;
	bh=zEbllmgiFfsLRk0pKgzNXwTCI+1F1P5ofJi8LFNISns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XXowWt4ziL/56y/Y94hdTEZbLLr97gz3vPYecgnU+2OLdzbRXNjVt79AFC23MY5tr
	 oTJY4tAIVUSxYNA273DbifXhFQN5PmgBpv0TsVokaKinyjXefw20slNXoVFuzwiHLS
	 F6ZYPX0Cqw7UBvBS+5fOLuIQVKaCqWPhvvdVx7EVb3HJaQ4wuHkk+WrSgfva1xzANX
	 bHdWs2TB7EVaJ4pr9L0v2ILwyY9eS00lIEN1Y7x7dNWVkC56JD9zi1iKd9QoWfdwqu
	 /X8/fzcyQTfJjStJTXhyCnJotJ5LbvBVoTP27bIDNCCQV90j0yhBvB6DJjUfHmgpLx
	 LQAT+4T8xfxRQ==
Date: Wed, 23 Sep 2026 09:57:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH v3 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <arOMefPN1gxMpyx8@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SSBrbm93IGV2ZXJ5Ym9keSBpcyB2ZXJ5IGJ1c3kgYnV0IEknZCBhcHByZWNpYXRlIGlmIHBlb3Bs
ZSBjb3VsZCB0YWtlIHRoZSB0aW1lCnRvIGhhdmUgYSBsb29rIGF0IHRoaXMgaWYgcG9zc2libGUh
CgpJIGFza2VkIGFuIExMTSB0byBsb29rIGF0IHJldmlldyByZXBsaWVzIHBlciB3ZWVrIGluIG1t
IChzZWUgYmVsb3cpLCBhbmQKY2xlYXJseSA3LjMgaXMgYW4gaW5zYW5lIGN5Y2xlLCB3aGljaCBJ
IHVuZGVyc3RhbmQuCgooQW5kIGRyb3BwaW5nIHRoZSBUSFAgTSwgcmVtYXJrYWJseSwgaGFzIG5v
dCByZXN1bHRlZCBpbiBhIGRyb3AgaW4gcmV2aWV3Cndvcmtsb2FkIGZvciBtZSkuCgpIb3dldmVy
LCBJJ2QgYWxzbyBhc2sgcGVvcGxlIHRvIHBlcmhhcHMgJ2dpdmUgYSBsaXR0bGUgYmFjaycgdG8g
dGhvc2Ugd2hvCmFyZSBkb2luZyBhIGxvdCBvZiByZXZpZXcgYWxzbyA6KSByZXZpZXcgY2FuIGJl
IHRoYW5rbGVzcyBhdCB0aGUgYmVzdCBvZgp0aW1lcywgYnV0IGhhdmluZyB5b3VyIG93biB3b3Jr
IHNpdCB0aGVyZSB1bnJldmlld2VkIGZvciB3ZWVrcyB3aGlsZSB5b3UKYXJlIHdvcmtpbmcgc28g
aGFyZCB0byByZXZpZXcgb3RoZXJzJyB3b3JrIGlzIGEgbGl0dGxlIG11Y2guCgpUaGFua3MhCgri
lIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilKzilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDi
lIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilKzilIDi
lIDilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilIDilJAK4pSCICAgICAgcGVyc29u
ICAgICAgIOKUgiA2LjE3IOKUgiA2LjE4IOKUgiA2LjE5IOKUgiA3LjAgIOKUgiA3LjEgIOKUgiA3
LjIgIOKUgiAgNy4zICDilIIK4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA
4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSkCuKUgiBEYXZpZCBIaWxkZW5icmFuZCDilIIgODQuOCDilIIgNzAuOCDilIIgNDQuNSDilIIg
NzQuNyDilIIgODAuMyDilIIgODUuNyDilIIgMTA3LjAg4pSCCuKUnOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKU
gOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUpArilIIgTG9yZW56byBTdG9ha2VzICAg4pSCIDUwLjkg4pSC
IDI1LjEg4pSCIDE2LjAg4pSCIDQ1LjQg4pSCIDM1LjIg4pSCIDQwLjEg4pSCIDUyLjEgIOKUggri
lJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDi
lIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDi
lIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilKQK4pSCIE1pa2UgUmFwb3Bv
cnQgICAgIOKUgiAxMS44IOKUgiAxNy43IOKUgiAxMi44IOKUgiAxNy44IOKUgiAzMC4xIOKUgiAy
MS4wIOKUgiAyNC4xICDilIIK4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA
4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSkCuKUgiBaaSBZYW4gICAgICAgICAgICDilIIgMTcuMyDilIIgMTIuOCDilIIgMTUuMCDilIIg
MTQuNCDilIIgMTAuMiDilIIgMjQuMCDilIIgMjguNyAg4pSCCuKUnOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKU
gOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUpArilIIgVmxhc3RpbWlsIEJhYmthICAg4pSCIDE1LjYg4pSC
IDE5LjMg4pSCIDEyLjUg4pSCIDIzLjgg4pSCIDE3Ljgg4pSCIDI1LjIg4pSCIDE0LjcgIOKUggri
lJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDi
lIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDi
lIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilKQK4pSCIFNlb25nSmFlIFBh
cmsgICAgIOKUgiAxNi4yIOKUgiA3LjcgIOKUgiAxMy4zIOKUgiAyMy40IOKUgiAyMi44IOKUgiAx
Ny4wIOKUgiAxOS4yICDilIIK4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA
4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSkCuKUgiBTaGFrZWVsIEJ1dHQgICAgICDilIIgMTMuMCDilIIgNS4zICDilIIgMTEuNyDilIIg
OS42ICDilIIgNy4yICDilIIgOC4yICDilIIgMTQuNSAg4pSCCuKUnOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKU
gOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUpArilIIgSGFycnkgWW9vICAgICAgICAg4pSCIDEwLjYg4pSC
IDE1LjAg4pSCIDExLjcg4pSCIDE1LjAg4pSCIDEwLjkg4pSCIDExLjMg4pSCIDYuOCAgIOKUggri
lJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDi
lIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilLzilIDi
lIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilKQK4pSCIEJhb2xpbiBXYW5n
ICAgICAgIOKUgiA2LjAgIOKUgiAzLjAgIOKUgiA0LjEgIOKUgiA3LjEgIOKUgiA2LjcgIOKUgiA2
LjQgIOKUgiAxNy40ICDilIIK4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA
4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSkCuKUgiBLaXJ5bCBTaHV0c2VtYXUgICDilIIgNS42ICDilIIgMy4zICDilIIgMi4yICDilIIg
My4wICDilIIgMC45ICDilIIgMi45ICDilIIgMTYuMiAg4pSCCuKUlOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKU
gOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKU
gOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUmAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
