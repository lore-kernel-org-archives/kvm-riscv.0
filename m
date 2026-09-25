Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C5C98321
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKgiW+k6p3iVhetPtjRGoIJHe1UjmU/z+UBuXDWDEEA=; b=mHDbMJ03ejV7c0
	lxIZqO714p+m5EB8y0IynlCQXE2zCfiPl6ylI773cFnlk+BedspL/FjwlWCE/GPamTwojT7QDpbAq
	DKRjiys5ro4mAxf6Q8yanqyowPprhEYUCKCv3tkzrPzzWLv0sGmgHzKyLPbBs0kHDwJynA1vzDMij
	p3aMxptc7Kbm18l6VA/5AcCV42cmSDia/BNelu9cAZWAOstVLUcxz+fOKrnqmLLNKwYKgn18Wp7pv
	xf+32uLZjEp6elx7Y/TWgsOvn+QfQ+42Spoi5ZSfxeKJ1hukRwGnHrIAIQkUkFL/JAit1I//2ElKE
	XKqc5zhu4tJiQXXiTJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0Mm-0000000CoBu-0Qfq;
	Fri, 25 Sep 2026 07:29:08 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0Mi-0000000CoAQ-25rd
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:29:06 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-532e9ad9a1eso202801cf.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 00:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321342; cv=none;
        d=google.com; s=arc-20260327;
        b=UJyMTgRmt7aPcJltJ8PShBCRw9tjQGU38JdvXJjbHYzJE1F7zBAAnWhrS6NaWpurG1
         sNg+AVpNMItuhm7c802Gnh8epgdN3+osHT2+UilWde0pE9f9o08HEUIbf+7qIC8oIJAo
         /MW5u6xQak2ULofdyWL7IXM4EhRP8/5R1OEYs3j/ITQWUfj6jXCaTcqkYFIbYqJkegSi
         bb1Km7hVe5xiXl30hyxkHGTwto+S9EwXXxBXzopZgFamnfboInSnaN5qKQnvFl/iTXyx
         1dDDF+svZH88Mk2hMuJgQ3R/sv/pAmqLZxQNgh5pXMfPIBebiwcYXwThbz3YRnpDGTZe
         MjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        fh=EIk67SLwHRe13ECcEcDBcebDFnsygDu2S0NvZo5+Kiw=;
        b=J0lhtQC3LDXe+ro4TGD6wmrYFWwwPTFuMmLT7Dw4Kz+jepA3SLrOIVtY/5lEy6ELtg
         SVqSMEN0UlM3p6Zr564U5bwjxwjuQQ9+OPhbZVvd3fFRDJNMr59X4ddfq9evQjFZzmIF
         9UCyD8vkO5NM7yj/4v2Jw5fJ+G+ZM5Jk+AX4cVeNefJ+bGf8zdTvsNKLfIgUe1KWArPt
         dGK0p/CW6PznfhtuzC8sjJOi+k0IIslgoTgUJprnq6zgkBct8x41Ma4KAIOAt1nPr3ty
         3rnhuv7VfQ7zJNepZz26CGuHWS6UNPYhbFR64ltxDoFKWz/DXprsHxZBKU8VlQg79pLG
         T20Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321342; x=1790926142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        b=gvKezrDZ13f7JZTvv1qfiJnyqVUkY2e3jNKsL49JpAe91oRSow93tfjGjWysHYnzHU
         MIBn2hyKF4UTutw8CEeDGRUFl08fFEq9YODusluMG1ViiAEPFQy7/7N8hJ7DRi4XeBLT
         7EY7exsupauK9ahhQypMF0HF4NlbeyTMABVXtiAeYpg9t+yStnf7tJuzK+/0v8NANPPM
         s5WJPf7NkkE+YHAi19M0bUlZsLQ28CFen2R8vRBU02HJG3CFZ5Qz0wm7qKdPSG+cIW57
         Q1ddyr4BmsOglenfOapwG2ikQnCym8NxMAghb+5jUJ/6d9RO08qN4fFLUHlIE3WG7pH6
         3JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321342; x=1790926142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        b=ZgDw7Yd2gMFoYppL5YnW157eBjjBLBK6XP9FM2K/w6oMXUM8iwFiM/AsxBgy5Qtxfp
         qm1L1c+3tOdQDHYMVUMQ4epgvD+8LygwiIbc27/vWQMQwpjsNAz3UFyoP8GmPIYxaiYC
         d9tmjopkf6hTjpraiWNVMZbGjQQPZDcUgMWQaETh12D38aBP/E3xgwIKWkMBbDsb9Ljz
         hkoHM2tmavzE+gaP1rB64shohjPRS+nbDCcGgXyp7wMIBIse1vTxMn/JBlw6u+XeFqwb
         NOT0l49QFF3u5g1v+AWYAEv3leD2hRhu1Zuhqhn+9vfLr+Ktbu45G4hvGK0ONb8R23E3
         kYYg==
X-Forwarded-Encrypted: i=1; AKwUvBzfG6YWLq3OfF3/9o5FWVYSY7iaEWdd16Uwa8nFfFRY7H5uQ4aqwyVj665oF7LNs2Jh/U4qYHZTHEw=@lists.infradead.org
X-Gm-Message-State: AFuF++kA4ZTkfJ/CjdZOSOeTaywv63AXVvQdarkiGtdGNJzoBtqrjbOy
	76/0la6jHoZfphVuVfKWAjrGLuHeTB6ppIdKY+y1MpzdTO+0KZNazBCyPlGCgS0DvPYtcuKSCPi
	u22wtHyK6F9H4uiq0AWzOZaaSVt1pruCOxMtuhIsP
X-Gm-Gg: AYBFou3DCawKbrPJIE1OIdLmq/aN0UDzkL9ZeweCUNsELFHPP2KcXdCJC/cuzRUADwo
	k90WgW+jmmlCdw5FBlUduio9FGu0wPe75Ze9egDmV4pmyJkLl7/Wq9DB9SmxGqGPSENYKF9ss7s
	CYR7aWi8PkiueHEd5wyoq0PLpE9uHzKJ7vZ0Q2KDa792cVQIymx5xi0XS2N3MZw4vEmcdtDTU5h
	1+wCDrG3Kkw7qOd7qAV8ysZCTnKvd6Fq3VBJ++S4Ww3FuPR+GR4eQMuL0mJS8nFl3+OnDDf/iTh
	u+FJEFkNGCB1MNap7H0fWA5pc4cXWqMoCit3d189PBb8nPYyPMfe2Q==
X-Received: by 2002:a05:622a:4c15:b0:531:d8:e437 with SMTP id
 d75a77b69052e-5330e1083a8mr8850471cf.7.1790321341004; Fri, 25 Sep 2026
 00:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:28:49 -0700
X-Gm-Features: AclHuK8wpU_boMBtoQ2BxSfl48UrjTg974xy2tCF5bv_vM_I_Kq5OyVf7aIl6LM
Message-ID: <CAJuCfpF2U9rgHmhaDoXX1hxsuuS=s-oWK9Nk19TDQ6CLpjhFVA@mail.gmail.com>
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_002904_574022_47F5FB82 
X-CRM114-Status: GOOD (  25.57  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgOToyNeKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gV2hlbiBhIHVzZXIgcmVxdWVzdHMgYW4gbW1hcF9h
Y3Rpb24gYmUgcGVyZm9ybWVkIGluIG1tYXBfcHJlcGFyZSwgdGhpcwo+IGludm9sdmVzIHBvcHVs
YXRpbmcgdGhlIFZNQSByYW5nZSB3aXRoIGRhdGEuCj4KPiBIb3dldmVyLCBpZiB0aGUgVk1BIGlz
IG1lcmdlYWJsZSwgaXQgbWlnaHQgdGhlbiBtaXN0YWtlbmx5IGJlIG1lcmdlZCB3aXRoCj4gYW5v
dGhlciBWTUEgd2l0aG91dCBoYXZpbmcgcG9wdWxhdGVkIHRoZSByYW5nZS4KPgo+IEV2ZXJ5IG1t
YXAgYWN0aW9uIGN1cnJlbnRseSBhdmFpbGFibGUgc2V0cyBWTUEgZmxhZ3Mgc3VjaCB0aGF0IHRo
ZSBWTUEKPiBjYW5ub3QgYmUgbWVyZ2VkLgo+Cj4gSG93ZXZlciwgdG8gZW5zdXJlIHRoYXQgbm8g
ZnV0dXJlIG1tYXAgYWN0aW9uIGZhbGxzIGZvdWwgb2YgdGhpcywgYXNzZXJ0Cj4gdGhhdCB0aGlz
IGlzIHRoZSBjYXNlIHVwb24gbW1hcF9wcmVwYXJlIHZhbGlkYXRpb24uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBtbS92bWEu
YyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9tbS92bWEuYyBiL21tL3ZtYS5jCj4gaW5kZXggZDZlZDEwY2VmYzhmLi42MmYy
Y2UxYWQ1YTEgMTAwNjQ0Cj4gLS0tIGEvbW0vdm1hLmMKPiArKysgYi9tbS92bWEuYwo+IEBAIC0y
ODA5LDYgKzI4MDksMTUgQEAgc3RhdGljIGludCBtbWFwX3ZhbGlkYXRlKHVuc2lnbmVkIGxvbmcg
cHJldl9zdGFydCwgdW5zaWduZWQgbG9uZyBwcmV2X2VuZCwKPiAgaW50IG1tYXBfcHJlcGFyZV92
YWxpZGF0ZShjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpwcmV2X2Rlc2MsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogSXQgaXMgbm90IHZhbGlkIHRvIGV4ZWN1dGUgbW1hcCBh
Y3Rpb25zIGZvciBWTUFzIHdoaWNoIGNhbiBiZSBtZXJnZWQsCj4gKyAgICAgICAgKiBhcyBhbnkg
c3VjaCBtZXJnZSB3b3VsZCBsZWF2ZSBwb3J0aW9ucyBvZiB0aGUgbWFwcGluZyBpbmNvcnJlY3Rs
eQo+ICsgICAgICAgICogdW5tYXBwZWQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmICh2bWFf
ZmxhZ3NfY2FuX21lcmdlKCZkZXNjLT52bWFfZmxhZ3MpICYmCj4gKyAgICAgICAgICAgV0FSTl9P
Tl9PTkNFKGRlc2MtPmFjdGlvbi50eXBlICE9IE1NQVBfTk9USElORykpCgpBbnkgcmVhc29uIHlv
dSBjaG9zZSB0aGlzICJpZiAoQSAmJiBXQVJOX09OX09OQ0UoQikpIiBwYXR0ZXJuIGluc3RlYWQK
b2YgYSBzaW1wbGVyICJpZiAoV0FSTl9PTl9PTkNFKEEgJiYgQikpIj8gVW5sZXNzIHRoZXJlIGFy
ZSByYWNlcwpiZXR3ZWVuIEEgYW5kIEIgdXBkYXRlcywgSSB0aGluayB0aGVzZSB3b3VsZCBiZSBl
cXVpdmFsZW50LCByaWdodD8KCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsK
PiAgICAgICAgIHJldHVybiBtbWFwX3ZhbGlkYXRlKHByZXZfZGVzYy0+c3RhcnQsIHByZXZfZGVz
Yy0+ZW5kLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzYy0+c3RhcnQsIGRlc2Mt
PmVuZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwcmV2X2Rlc2MtPnZtYV9mbGFn
cywgJmRlc2MtPnZtYV9mbGFncyk7Cj4KPiAtLQo+IDIuNTUuMAo+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
