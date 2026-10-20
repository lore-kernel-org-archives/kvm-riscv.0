Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0B606A31E
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lV/x59oW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nwEKQ57p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4x8MwkMj4j6znjCNnt7hdie0qesOoyDdvEwbHJH1/3I=; b=lV/x59oWBvzd9L
	jqd9J9fGioCb6V0LcGEDxP1gHkGv6GBNgNPTbwWEM527CZXYBX8TIGTK4oZFVlP/jQh2TYsZzOFvh
	69azWn0ys+a7KBc4MfewVh5k5OhFOKIwRbN5qMmE9k0XNQIJ22nQPasSLmBOaC+k6lqlRfV4uoiGx
	PHt//NKwheABcdOqzeeiktnELfJ/XDYWyRPnf51JdKGd+ddtFUk4zoqGPSTZw6wZODpQcPtnIceNm
	4RmVxvtcPgPQph0SklcRpyf2rgwbmQaWesyigelNnSWJ4dziaVCkXTR71HWBmZA86qR7MFalEP2XA
	2nS+Xpd453M338wEFf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHft-0000000Ai58-3oyW;
	Tue, 20 Oct 2026 21:47:13 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHfs-0000000Ai3z-0gsT
	for kvm-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 21:47:13 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93ece7a73b9so12339985a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 20 Oct 2026 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792532830; x=1793137630; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvIPEfkdtZUqofHUAuuyqlxSRMhwpGZiFkVH0+y5Y1c=;
        b=nwEKQ57p05JC12Hgl4LfftTdtDGShFH+/6Am9oXqf0nOVddjXfGH2MZeb5/ZjCTXig
         N/n1gt8x0TZuxmr+iNp+7XvPo6DK7nmb0vPnkQj9F9pciAa/+P/FhxerWalwtq6zZGnf
         rSVX8+x7DQyzNETMkeI72KQMtQaQ6CV8/h2b13fn5gJ418Cd9/77GBnJE/uj2s3TQMNQ
         NCF9gwY5Q3Y+yw3qTlKxU0m6jvBLHpO8/izrNLimRX8aSd6ZbgeJaGMizzCrJgGChqja
         858yxYbZJK/rdrdFr98uExglf/oTZsm/hk9k77kQkyU/rcPUm9I18QG0grpXsC/VGBlN
         qpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532830; x=1793137630;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvIPEfkdtZUqofHUAuuyqlxSRMhwpGZiFkVH0+y5Y1c=;
        b=FxtoyAEbyITBPJBdaM9wkxyLFf2jUsrz+4WspJdDt+p8CCsFDUn3yVh7c+BzeVxBkd
         BJut6D19jRHQn9YfQbVplcvgXwWuqFPy48vZ9M/1A9zwrZII00equb3C8y3wglsQIYBc
         LkYAmKjwG5/fJjXLDziiValt5FV40AJVTLkCUDDufxxEoQ3JNK2NDTUgv25c6zIBrBLC
         0VSvjGBVV3c7+nObQgvd3xYqIrk90yEfv/oeRDCFQ/H3UcjHZ2RamM4L5x19Gf1hWNMU
         JJCYBNh4pzT9K0HXDxbTfvg6KK78dYyZ0l3iVg4d/z3Ce0bXOiMAbraByd5z7Ax79gVX
         8hzA==
X-Forwarded-Encrypted: i=1; AKwUvBxDkdBnsf8/l/9xcZm+qPWRJYcPLcxP0E22mrluloS1iitxs1YWMNqkm/vwqWVCFAX+jPcSmQ3xtqM=@lists.infradead.org
X-Gm-Message-State: AFq9FYLHisyg4JSRnjk7em/iQ0hVfkk674oSKL3KxcJK8M21k8xSttiR
	9CBtVcptF6HyXvHEEKEhIw4oVtie9lGAB0YoUWI5ewBnC5SO0mW3vLnNupnyYoyqDWI=
X-Gm-Gg: AYBFou2kUpok5R2Y1wkdWYxxWI0AQ992M7vgnnb7z2pYC52JvJu2a0+a1ZyZnfMzyur
	krsugXZQUN7OtGV+bH5oZ9zYwA3cAOdxjh8HTcNhKQX3gjyUQr141EXpmSjB6CMDh8Tb7QftVaC
	rYrc9hItVU3imJr/R6DpghQkqy9op9TaOdadOWERLCCo8zk0laP3e/mbt7mQGaVyqBX+xtk9EiV
	5PY2HDeN/4gkGyjjFPIFI4IZ5iRwTSo+IfJzFgV6fqFCBOxqi3FTCSoG5Tszbbkrc2w5oF20w/P
	8eCkKXmi3rdSTjsf7+Fjsj42BfpImIH/cBGc3JvnOyom6GHcHZRv4+gEwFSOsFu1sVjwlMd67tL
	pfQL3YP6psaHiBJuws7+uewWP0Elatb4owgOsXHQICHkCHont2SXR2xthgqpoxqTIf0LVVqnj5z
	NRN2vmk8Z1toAs4Na+7o8+2b/+GeNfS733t5itEiyQVa5JaSSx5VG2lsezuoyvvtf49xohtI3DH
	6rPR0JBMIG43ngjLqh3QRNjC2Kmqy4/aiZ5kbyCaTXtR1SQbC1eagADuPLoBeLMQ1M5MIulby5M
	ddlbLCJfTCpGWD0biB5hXNbFRjQ=
X-Received: by 2002:a05:620a:198a:b0:93f:3391:d5a1 with SMTP id af79cd13be357-93f57f65930mr93498685a.75.1792532830268;
        Tue, 20 Oct 2026 14:47:10 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98978sm86912785a.10.2026.10.20.14.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:47:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 01/39] mm/vma: fix mmap_prepare file handling,
 remove file_doesnt_need_get
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
 Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>, Bert Karwatzki <spasswolf@web.de>
In-Reply-To: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-1-1aa3c9b139f9@kernel.org>
References: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-0-1aa3c9b139f9@kernel.org>
 <20261013-b4-mmap-prepare-vma-flag-sanify-v6-1-1aa3c9b139f9@kernel.org>
Date: Tue, 20 Oct 2026 17:47:04 -0400
Message-Id: <179253282492.1207257.6426479952081115792.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_144712_260805_F4E5E8A1 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-13 16:04 +0100, Lorenzo Stoakes (ARM) wrote:
> The map->file_doesnt_need_get flag is confusing and the existing
> implementation has holes.
> 
> Drivers are permitted to change the owning file of a mapping. If they do
> so, they are required to take a reference on that file.
> 
> The mmap() operation which ultimately invokes __mmap_region() is guaranteed
> to drop the refcount for the original file the mapping was made under, but
> this is not true for the replaced file.
> 
...
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Have a nit below, but otherwise

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> +static bool map_same_file(struct mmap_state *map)
> +{
> +	return map->vm_file == map->file;
> +}
>  

Terrible function name :]

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
