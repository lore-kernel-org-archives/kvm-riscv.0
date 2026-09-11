Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77720C88E45
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIkW8FSgi/Gmaj7fFw7tBiglcfBx0LLU1rRVlhzT8zA=; b=qI+08h6QfHqY7c
	jJnmVneUpjMmXzvkfSsjf52539V8rRmD0wUGd1xIRW6CjDzPqMtINwLXzdiQKOM6ENQIRMm/w3dSO
	XcmVJGgOb5czoYg2iX7FAjgT5evTaYCyioCN5BGsrC2N8DdDv7ObUNae4yk4zeTFs9X4PPLunnvw3
	F2c/lZeSezdSEFuezcWYfrQ/5ZVjdtwI+uwjfygsHQ3Phj1tC/x0K+wZNeDoHXxzWmEag0uSdhir/
	f8v4HrKxflIjK1/LQRDLKV7E8dmtJQ+OlF80Ig+FkRBSte9L3v0V5a2dF8sPHNW+aBrwHNgLEH+GJ
	FI41ewFak3spbTHGb2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52pT-0000000H05G-2ZsF;
	Fri, 11 Sep 2026 15:06:15 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52pO-0000000H03h-0oKR
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 15:06:14 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6f5fc7so647607eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Sep 2026 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139169; cv=none;
        d=google.com; s=arc-20260327;
        b=oEcOCd3lXO8zfUqGBQ9uQo3ZgE4rYYFKGw7oxvHjYr5L1c8hK/+ZCWvZxLuB7cv3sv
         2kYteqLojQcQ6z4AOEFaDh6BEj207WAmoxd++unk1SgUQEXSIpDZjAz7gT/XzGLwGJin
         /V1eaGmUU0akE7dVnXSmBUAWtWHewKy/Maj0BVW+I6FB2Y+LQXJJSvT9jw/qQfLX++gP
         mpozQDcHcN709O3xh/wnSJx37tyQeneGfvazYI5Puee9erQwfTqNMJEJyQJ0QjrPbLei
         8ZG+12v6Rc8nQ1R+wN2/6hL8euRCdttel4+Kdmkm2Qsee5SDorksBtuHOF7rhmkUpC+K
         Nw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        fh=r340YKMACjZKNVX2TEVMvYNaoevNW5Db10/BtZg759M=;
        b=E6/C94481wtxXuqzTwRl+XfWVT4RCWmegJW1LTvP6eaZkoX3vVFf76Ex0BxdHPv3yc
         4cx2HFVp/izWFMDMkQRO8flmwRK9CScwlw+CCokrHCczzoEBkYx7IB7UjT0Xh92iNmkH
         +mlatUI0etNV01rBMWqA3e1daZ8KfQ5I9rbdh+sT8AtUpYYCrVpaLUduAAy861kIN/v/
         FXpIT94Id07z1eKe8cqv0mWN1kpFojRDa0FvyWg8Bh3R4ZfbmRxlYKuWHfkxnT3ZITsz
         Ph8JpywPBn+lmeaw3vDc1Vbln+ce9UkGjtJKym0npO+Qzk05qdy991FXzoGfacNwOohf
         fWZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789139169; x=1789743969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=Wwb+Vhcxqf0SFxlr5nOgWBdID0cDHNGCCvcXmVrx8xpahD4BfPigTtF6ZFUCYyh0Sq
         z6wXktpcC+2lEwzBCH+1rIcZU2hKswbnnl2Kz8CTJcJ/Q1JWGqFISwKDE7MBPU93q95b
         94tEP6Wq8HYI3Iw64mR7iJjH40gSHBLVd+tguUz5ox74mvUdfFKFtJ4R/4MMGrBotmi8
         Cq1Vv8EsCUoHxiRInha9X4/YznrBEZpaYSKUGA1zUrKFQpAi0kWt2vOxky+uJvH8v+NX
         UqykAdl+0w5OQ2VFmA5N8a4IMQfO8C1PDBfgEhbDfCvkH8mwXEDJkPyqbTz1+qZwoiYM
         yH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139169; x=1789743969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=FCDiPDBl8JKIJdDlhoOysoO+TnInnDBzVRjlNeII09qzvRqgv6PJ97CGkD4KFh7ZdK
         AQ4Oa4S97JVHDm+1jIqfKt6bAkfq7z3pcsm2bJlWTcN366iZ+pB8teTZffK8OvruN4fe
         KptXEBmYxXGGX/o5+QSvL3AxKN/pf4hsq2bEPKfMylukX1bLAr3iTP6AQk+7yW16NR/6
         4e+RVlaOPnbfvT4j1MCqHDAcgjIrXeLwkJqlW2M9AyVUY/IKdiXXC+ElNb/ove3unpwS
         xJ+mvPAEYD/5+fl5sdzyahCdRU3FJYzOafQeqFddaWUImi1+alX9K6frGU6edAemuzSe
         oOHw==
X-Forwarded-Encrypted: i=1; AKwUvBzzHSgEdC40O+6wvx9DtjYbcpixj0UHaOoBD5SXhFvYf7ygtM930w9cYE2Wb/jf6ZquO5G6d28i8es=@lists.infradead.org
X-Gm-Message-State: AFuF++loOsv2y1QOtqbLice/qjcq4X4AXzHLl7EhgBk7nOu8C96QGkST
	BTDqDcEKRQ3CW9JA+CtfMOcBUECplMHLAKsY2cuie5TAGE5v2f0SdSTX/dhv1DdEhXryoB3xUVu
	dWrIVsLw0ADsnDpLDfYGYaknmYZ8BAVw=
X-Gm-Gg: AYBFou2e6HbaSfQgRSFStMF2o4K4g0I2brYgzwgQQyg42as2EWxhnQvD8Tii7fbk01i
	7fTwXSkA8ohvSB3By0M0J1G6mr5CCuIwXWD9IFnOJfNqP4uIA4n1LkjyB9LWtRelMpXWiCK36er
	Q4466sa8xSIpO7oedtf2y5mKFR+ZfeaAZ6/2WUZ18rs/xy4YQWVu8P5PXwjycZ02aV7XKJpgdeV
	W4RCWTQZ34wLXMxKUKSX5AugpA9bhrjJeLRmCvhx99JPJfhdaDPxxncOhEmoWCqut8lNoPDY2ih
	+U7WmPdTdyVPt1CR+a0ZeuSgUbBvfFGOhaL6tSFDOjKhjeBjP0Ivxls=
X-Received: by 2002:a05:6820:8585:20b0:6b1:be9f:ce6c with SMTP id
 006d021491bc7-6c0b9d4e35dmr4967721eaf.4.1789139168581; Fri, 11 Sep 2026
 08:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
 <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com> <aqPUqU3eZeFrykj3@gremlin>
In-Reply-To: <aqPUqU3eZeFrykj3@gremlin>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 11 Sep 2026 11:05:57 -0400
X-Gm-Features: AcwNN1UL9TCHStClpz4OqpdpVCOHFGRlTtL1ELl-GfcxGBMtPjfBSuHNlaSY27Y
Message-ID: <CAEjxPJ6P19eKF-c+mm2BSr5_WpmhMTZjjUfSamv3SfOPO4SGVw@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_080613_271390_1528AEDE 
X-CRM114-Status: GOOD (  23.17  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgNjoxNuKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMDI6MTE6
MThQTSAtMDQwMCwgU3RlcGhlbiBTbWFsbGV5IHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgOCwgMjAy
NiBhdCA0OjA34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUgbWV0aG9kIGFuZCBp
cyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+ID4gPiBzZWxpbnV4X2ZpbGVzW10pLCB5
ZXQgc2VsX29wZW5fcG9saWN5KCkgcGVyZm9ybXMgbm8gb3BlbiBtb2RlIGNoZWNrLCBzbyBhCj4g
PiA+IENBUF9EQUNfT1ZFUlJJREUgY2FsbGVyIGNhbiBvcGVuIGl0IE9fUkRXUi4gUmVqZWN0IEZN
T0RFX1dSSVRFIGF0IG9wZW4sIGFzCj4gPiA+IGtlcm5mcyBkb2VzLgo+ID4gPgo+ID4gPiBUaGUg
ZmlsZSBjYW4gdGhlbiBuZXZlciBiZSBtYXBwZWQgd2l0aCBGTU9ERV9XUklURSwgc28gZG9fbW1h
cCgpIGFsd2F5cwo+ID4gPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQ
X1NIQVJFRCBtYXBwaW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+ID4gPiBjaGVjayBpbiBzZWxfbW1h
cF9wb2xpY3koKSBjYW5ub3QgYmUgcmVhY2hlZC4gUmVtb3ZlIGl0Lgo+ID4gPgo+ID4gPiBUaGlz
IGFsc28gc3RvcHMgc2VsX21tYXBfcG9saWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBt
YXBwaW5nIHRoYXQgaXMKPiA+ID4gbmVpdGhlciBhIFBGTiBtYXAgbm9yIGEgbWl4ZWQgbWFwLCBh
aGVhZCBvZiB0aGUgY29yZSBlbmZvcmNpbmcgdGhhdCBvbmx5Cj4gPiA+IHN1Y2ggbWFwcGluZ3Mg
bWF5IGRvIHNvLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFS
TSkgPGxqc0BrZXJuZWwub3JnPgo+ID4KPiA+IFdlIHNob3VsZCBsaWtlbHkgZG8gc29tZXRoaW5n
IHNpbWlsYXIgZm9yIHRoZSBvdGhlciBzZWxfb3Blbl8qKCkgYW5kCj4gPiBzZWxfbW1hcF8qKCkg
ZnVuY3Rpb25zIHRvby4KPiA+IEluIHBhcnRpY3VsYXIsIHRydW5jYXRpb24gb2YgdGhlIHN0YXR1
cyBmaWxlIGNhbiBicmluZyBkb3duIHN5c3RlbWQKPiA+IHNpbmNlIGl0IGlzIG1hcHBlZCBieSBs
aWJzZWxpbnV4Lgo+Cj4gWWVhaCBJIHRoaW5rIHRoZXJlJ3MgZGVmaW5pdGVseSBtb3JlIHRoYXQg
Y2FuIGJlIGRvbmUgdGhlcmUuCj4KPiBUaG91Z2ggSSB0aGluayBvYnZpb3VzbHkgdGhhdCBraW5k
IG9mIHN0dWZmIGlzIGJldHRlciBhcyBhIGZvbGxvdyB1cCBhcyB0aGlzCj4gcGF0Y2ggaXMgZm9j
dXNlZCBvbiBlbGltaW5hdGluZyBhIGNhc2Ugd2hlcmUgVk1BX01BWVdSSVRFX0JJVCBpcyBjbGVh
cmVkCj4gaW5jb3JyZWN0bHkuCgpBZ3JlZWQsIHBvc3RlZCBvbmUgZm9yIHRoZSBzdGF0dXMgaGFu
ZGxlcnMgYXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3NlbGludXgvMjAyNjA5MTExNDU4NDAu
MTkwMzktMi1zdGVwaGVuLnNtYWxsZXkud29ya0BnbWFpbC5jb20vCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
