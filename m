Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE77C98326
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRVgEgSJOtm903SyAAvz49wjfkrqIwcp6GC3lB3yboE=; b=yngdWQok/T31eN
	mnekjypP8yOvy0h5fgvRrxD2nNcYAiHE0aworHxQnQNuKsuB0W4Qb02cr1cnaFqOQc36JmqYGCs1P
	AqLiJzTyE0+cOXxaJ5mITlw2DA8HA+zXSQun0O8AlihwWDxbLZjCRVfPOdxpPy/90S9WgEbwTymKo
	HuK6hXOgrYUHnUSF0g5ncJyl6NogqBNUYj73nyY6hSDNkO9xRcuP7CgMrpA0AFkAb/7sBeilYMkvG
	/iDB2uuLGCp/sbmOoqUcYyciATPDdvWk6AAeeN/EqryBG3YnYYdmU9jxqcRnAFfsAbXy8LLi7xCW6
	OjIANV3OTZwPPkK8ke9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0VB-0000000Cozy-0qBJ;
	Fri, 25 Sep 2026 07:37:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0V9-0000000CozK-20P0
	for kvm-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 07:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=; b=YPU6ennJ84i1RhbNNeWnJI6m3q
	wmNNU9vcWwzZhk3lmRGRb0VsrMz7P/wnQyONtj7pkNQ0gAOhYRyAaConGQJK7Gin3IjzdtdxI2mzX
	tZfhSDmgy4zT89OChpoWNDi59M+KZiM1pjC7B0Jt6F8wzTxpHx+abpV35lI4nkzU2L1DnCnzf2qUz
	g4Gn4pqEwZliGHsWXi7d4oD4T5EN9irLqJV1UYIwX6uzf7MHiYy2Jcio5EjxjkSmBKBYNpZyQaQpr
	yi+worh7sr5O3OYDSYcL7JFA21binWUutrS3qLqjzxhehL57UpXUVmfc8gNiA3dBKvQHjjfvCi33W
	HbVeiIDg==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA0V6-0000000GhHB-0fnK
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:37:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5561a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 00:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321862; cv=none;
        d=google.com; s=arc-20260327;
        b=UC8RCS9vDPLZ7VX7uHwrbw34PGwqHSc/Uritxki10mPeF9DIH6p9qrMzRYSLh+7TsC
         i02/d5+F+2BsbVgzdIiuQ3r4hQoVdDt1nuV/9ysMC3HQRm91dZGf4DwTQ5GhE9+mt5AE
         eD+NVnjcm+T1t6n6op8wCAh15sGM1nRSiSW0VTnAUiqeihociHcSNNISTWVI63dXpgta
         zX8aOmE+FdObxqFnOdcDrLxMoPzBerDjOd1dsb86mM0m0aSyG7j3RDFy/tTiCyf2ujy7
         wn5qPIscb+TWZq1mh/Fte0daEqoKYNYIARfuffShg5kIl9r1otGOE9z2Xa9rRF29W6pk
         Av5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        fh=tS7clnKvBbeGtmPEHG8845MfC1NjBokwXlxwYjLVRiQ=;
        b=mbdwptd0kMIpss1dIMXlKNl2WsFN4FrEH7hn+S+J8cZHYXtI2ou0N7nW/A6s4mx/z2
         SB+mvdCK7atiFex9WxQBspLN89vApM4fD6DC4hoi+JKHBwjGc72Txv7VIyfB33WU45rR
         kGgUk38qsUGNEV5FKd2yiqJWJIeF9lu7gB4O80JeXxm/YGnzD0HNV0ZgIMXLRirAbvGT
         7QnUlpgJrp3UFVPwKrceTn6p/pn9thQwuXNOvLOnsGFi3PKqaT109KS+K3vipngNq3Et
         DnqoYkfseUx0EYHBg50QfdoNZpaVYB3OEd/0sY11fH/KqSyKTOiIHyQ03a4X0/nKfFIG
         I1Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321862; x=1790926662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=qrm9mKREf/+gTUYupGych30pXPpjiEfKSlrJijM6jGHGa1eeOf+oUm18XhpkT+GPVf
         Kh9pLkmjQLQRaPc9Os63O+MPOH/QRM1aQ+7Ea78mI5eYDWMVpsX1Ym7Hx6NlqKqN75I3
         vejIH/egsfxe93gIYQEbd3U7X9EqGje1UoxnELKQ4uGvDuvnwf1Wtg7a9bbX3wpP7LLA
         LdmVHc/F10LuUCd2l6Eb506dmJ2DgVj/IVDO/6GMONKmKRCD0UMiRNFQnAc03cZpS808
         FRIoNOK+SDpOB/VMzOSOZcD53wx2ZBCq5sMdIPa8pFko5ryRxj3U12/p0PD32rmeRV0O
         zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321862; x=1790926662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=gakaIXYTZQHlizmZhlZ9nigPneVyTrYWnBF9c0lQH9xp9VH0WmgD38tzLf67HCssgJ
         debn/0Qv5AQIEU7GMae8AsOkR6mExuQOVOCSAXgQgIYDGAl0AHXMsZ5ZKMHVR58p2fCf
         8cn1ApSI85HcVj3qbKwCRXai7u74tZQG1721C7IG2fp7PoKsHOrSvM9IvXHyo/2aCnUB
         eOtb2Oke5BsAwtLZtBeDh+mmWKvPGQVdeNs0QJmH/5MsYB1nfFzfR05nz5Vij6iJKkXz
         Rfzr96+m5dziF9/Qo6JosTXG4DBzaYbEiasBy81x4/cLgA2+A6fz+YGMN5/qVX2M7jpI
         KuwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOUpwmwYowzvtTett4R1J0xeXw2CcSgAi8idRdM/Rl70XIYe6zcx2rtQRdaBZ4x+ly97wRBJ+6/Pk=@lists.infradead.org
X-Gm-Message-State: AFuF++nH/XuCXgSlHog29uAmMOIXscojWs1CxK5t8aW41XgjyjeIvGgu
	I/fvkwYoSBh11sW9bEHsYRmMuX8gm6XuYC6rbNMmQjDc2ci6eNBsoa8uGUfCmL6Smj4DQE/bfj0
	0pRTjyvWvRjIQfS2lfcs2NeQk49SD8oW7C8HxTOvJ
X-Gm-Gg: AYBFou0C+E92OJv2LSJCcwJNcUxZN+x3ZaRkeizaQhoEDkm/wnuTs9fZXd52wmnEScy
	EyZCNZiWNzAT2D6Y9uLhohAGC/P/yHsFpd+03oZhoMSCn308Tav4dFW1AQkfIxfItJZb6ysWgYa
	hqOhxWR6emJ25wPHrQ0QJ87kqtoraXoSr9fge2lQlZifZwDdCDK7oA/nV5cy+9iAmfATLydNXfW
	x9XKw50Go+IDhhB7pVm96dMZSoW02XRefqnE/MwB6haN8XKXEooF+XmAkdO+Jsq4ZFi2gy5ur/0
	niIO5Bs7N3m9uuSNckYdB8jn/YvPkDU50wIY3QVOlVJGKdNi8d+uyw==
X-Received: by 2002:a05:6402:2714:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aae4729638mr36915a12.4.1790321859803; Fri, 25 Sep 2026
 00:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org> <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
In-Reply-To: <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:37:26 -0700
X-Gm-Features: AclHuK_RUT9CXNFLpx8ZY_roLEZNzp5S3oNdpNL4cW25fJBFg9wRGnSWohuMdYA
Message-ID: <CAJuCfpH6AF-hOo4jU6OeNVpd+fgpqLpmcfAGs11J=nPCgAqG_w@mail.gmail.com>
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_083744_319471_2BD3466E 
X-CRM114-Status: GOOD (  17.14  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTI6MzHigK9QTSBaaSBZYW4gPHppeUBudmlkaWEuY29t
PiB3cm90ZToKPgo+IE9uIFRodSBTZXAgMTcsIDIwMjYgYXQgMTI6MjIgUE0gRURULCBMb3Jlbnpv
IFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4gPiBNTUFQX01BUF9LRVJORUxfUEFHRVMgaXMgYSBtb3V0
aGZ1bCwgZGlzY2FyZCB0aGUgTUFQXyBhcyB0aGF0J3MgaW1wbGllZCBieQo+ID4gTU1BUC4KPiA+
Cj4gPiBBbHNvIHdoaWxlIHdlJ3JlIGhlcmUgZGVsZXRlIHVzZWxlc3MgY29tbWVudHMgZm9yIG1t
YXAgYWN0aW9ucyB3aG9zZSBuYW1lcwo+ID4gY2xlYXJseSBpbmRpY2F0ZSB3aGF0IHRoZXkgYXJl
IGZvci4KPiA+Cj4gPiBBbHNvIHVwZGF0ZSB0aGUgdXNlcmxhbmQgVk1BIHRlc3RzIHRvIHJlZmxl
Y3QgdGhpcyBjaGFuZ2UuCj4gPgo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2VybmVsLm9y
Zz4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgfCAyICstCj4g
PiAgaW5jbHVkZS9saW51eC9tbV90eXBlcy5oICAgICAgICB8IDggKysrKy0tLS0KPiA+ICBtbS91
dGlsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrLS0tLQo+ID4gIHRvb2xzL3Rlc3Rp
bmcvdm1hL2luY2x1ZGUvZHVwLmggfCA4ICsrKystLS0tCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gTEdUTS4KPgo+IFJldmlld2Vk
LWJ5OiBaaSBZYW4gPHppeUBudmlkaWEuY29tPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNh
cnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMsCj4gWWFuLCBa
aQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
