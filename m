Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2938CA5FF6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2DiC9tuj81f29E7Ui7Zoxqw31MW4fzYog7Ap7fTl98=; b=weTFXPerZxf89q
	0hkOfwnueuBfos/b5WIiRk6qgnzc1kJoqDe5BcFdZwo+hqpFJev9FbHUxGLT1qZQnf+9gJTQ6gEF7
	7PLexbkL6Hz5nWchLQaSgUFS6O5oonCXrMegcE0HzftIXD0+bmbFPeXxdw7PQfUKpHttl+NvKmNz0
	pi6hk+KtYODi02Zc0TLSKkSy74D8kNMaIpswp4iqq8eY7D5/2uB+rxDXIC85qe0WQIHJP5d+ENXIy
	syLq5Cm9OJhA2K0Vjo/cF2QzBkAX2+JfsdIR6md6hogfWetMEsQCNVOxvUnuefwT6Xb9GrgorLYfi
	7l10Yhv4pY77kshURlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPmz-0000000F5Mq-28dR;
	Sun, 04 Oct 2026 17:14:17 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPmu-0000000F5LV-2c1S
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:14:17 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5337fa12431so180201cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134051; cv=none;
        d=google.com; s=arc-20260327;
        b=kT+S2lyhlK2ttEh2MeYmNTnYf82r4IzHorIx9CgYJoZ1Ojiz64GRUI3PmKNQ5Cz0c/
         PPEM2AiL1wtWOYEdQoBpo1HsIOJ2VOiucHx8Khehy1yiFW4ksQBADFIYNT1XOVHEuFbm
         h9QCAT6KixEuZ92jDN1XKB/9czdfcp1EfRWn/gNzKRLlxpOIKf/xVIyVuTQsrpCkccP9
         YtmOjGgwE2Em82NbSBmUxtO5J6wWPBETZl6LyqIQWZw62muwjWdlOwAWlPqjQYTIaf/i
         yojayloXuYaq6Xe6bJISq9jCw9Nb947+cQ1hUjghWUzhM+xdVWdytSr07JWJu7bCkNv4
         yh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        fh=urG1Ql35GkU1+JPMG2CdTgyK5AMCEV04s5oUoQ1inyw=;
        b=BuEuG94bvqTatyZcbGMgJecW6lb5bAuKmPALoIpiqs4Y4tM+uByZ9xSLFakWe3taja
         JXY0ExzJdvue7BhHKykfXb3+D2F/ijhHGOACZhuLvpOleylRhIDPyhIRlbY8zW9qfS42
         0CNZGuu22G9EKUWUJ9bCmg/PiaIOAXqcRhxx0q86rTx9Fqmzc74Eqts3m+31lbGeg4RU
         46ztS7oWXMJ11As1SCrbOyF92gVMX5kPXvOX2lIwCvuiT//Q4LIEMM7RL2gvSVXQIdSO
         w1FjNg8t4bxBTUUglK0uHkg8Qf+MYl2xx7IWL65MiGUjjTXEPv6wdV2zfXy24Gxv8QSk
         yAsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134051; x=1791738851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        b=tm+0/2ClHtALvEioZYchE3otPa0NrAIG1TruSfSbCA2w5J7Zxdcr3kLKSpXxHDI+DU
         eccFLpK6Htz6QmfOcO7auJU57cmyGdQ3B4JvtAlLM9xOF+XcEAoSyQxKRCwWulzfd2oU
         u7qRB72lsn0bz50HidNjGLFWL7tHXO3QSuG43V01g3fYJvshhJMNZZncX4n8/1gK/2Mc
         icHSomDcnHjDmNZss5rf2dobT6oRQEcGwkfk8+HGZ4Gz9cwKjgEXQ/HL/R59L7tgg+ri
         dQZVcDfDRZZHsjKwWmi6v/8wezRhWLpsIDJutQp4l0JC67+MYWboxgHJiGcO9gHeDrf1
         Y/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134051; x=1791738851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        b=WCkx4C2FYYvGGL64rlFXtJsqcPkbPRcgaplCSUEQ24TVcijmX6KUXcZ3v4YqvLGd/L
         Mbab5m2doG/5Fds1fiILFFWE0nDcmBro0ay7H22xbPBFNZ4dHg8dMWfwCHpfLnhzA5Rs
         IS6i7NMLD4PmILocLLs3HhmggAG71MM9wd0Gf+GlND9qH1Eu5xOqv+06VwhbR0cpAybp
         mkcwbVL1/o9qyywtFBgTrMxbukpgaV+pUqVjZHw2By4f92KYg6SQmv/1MWw6dymk8NCC
         F+yc2w3LfEGZUPYfaB2tp4noaUtOvuZZjmQ8ey7YhxMg68j5fScXTOV85ZjMarc/2w6v
         gjYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0aTBXaWx+MBArOjJf2a1SQ8b04C3YvzWThR5O7d2GTWO81rWOCWQTq2nWvT6eXZAruBqEOBk3xqg=@lists.infradead.org
X-Gm-Message-State: AFuF++nAW36Ths6ZNdepLCK5ISd+RwfEQ/a78oQaQ4w9GQmVrfZU5Ho/
	OIJETWpweadfeuU76ZZ+jALc3C3pNYslIJ7Loj0hDwGQKI2bO1y7ySZ/c5/hcaKp3Uj/9NisIG7
	YpHdfiI9bAg8bYLyAkE4wUdObI3VMoERw0I5zDE2B
X-Gm-Gg: AYBFou10SatjPiilj23hrwwvbSi+odqTKhP+rXmJf+KxtBbFMoJqMgin3UESZ1jy09Q
	4luzzv6F97OShrGibRz9KXw/JcuegXUDEN8LhU7wcTk97edn48Oo5FEK9qUgNayFvs8b6wYeVHa
	ZIlH98DLLW8c8DK2paJyBla2jSm3HzhLpEbamQMyUTYDyaMJhX7pLHbYWw/6qO+gS7om4EGaC7l
	ITrQY71OVu3D55O4w/1dsQ6sUthHDsARlgg8/va4QF5o6KSYju/nPxTExnQhwNgWR1UqmUnHx+c
	H7JjR8dD/qoscIjtlIZfqxY96AIr+aQKicGNBZiEdiFwhJ+rnR0k2OKN
X-Received: by 2002:ac8:574c:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-535131b2b85mr16314281cf.9.1791134050552; Sun, 04 Oct 2026
 10:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-8-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-8-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:13:59 -0700
X-Gm-Features: AclHuK_YbQsPp6UkU1wteVM53NVi6nuDg9G6v9WzIHWTTGIprDqvC1DHCMGs6A8
Message-ID: <CAJuCfpHPcgvpR+=CtNVJeFkTn4EkF=hSPH3ZvvpkZQqHS5kzug@mail.gmail.com>
Subject: Re: [PATCH v4 08/38] docs: filesystems: update mmap_prepare docs for
 discontig kernel pgs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101412_704238_E1489BCF 
X-CRM114-Status: GOOD (  33.66  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM14oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBEZXNjcmliZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBk
aXNjb250aWd1b3VzIGtlcm5lbCBwYWdlIG1hcHBpbmcgbWVjaGFuaXNtLAo+IGRldGFpbGluZyBo
b3cgdG8gdXNlIGl0IHNlbnNpYmx5IGFuZCBob3cgdGhlIEFQSSBsb29rcy4KPgo+IEV4cGxpY2l0
bHkgZGV0YWlsIHRoZSB2YXJpb3VzIGRpc2NvbnRpZ3VvdXMgYWN0aW9ucyBhdmFpbGFibGUgYW5k
IGhvdyB0bwo+IHVzZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1
cmVuYkBnb29nbGUuY29tPgoKCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1h
cF9wcmVwYXJlLnJzdCB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdCBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3Rl
bXMvbW1hcF9wcmVwYXJlLnJzdAo+IGluZGV4IDgyYzk5Yzk1YWQ4NS4uZGRiNDQzNGQ5MTlhIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+IEBAIC0x
NjQsNSArMTY0LDg2IEBAIHBvaW50ZXIuIFRoZXNlIGFyZToKPiAgICBzdWZmaWNpZW50IGVudHJp
ZXMgaW4gdGhlIHBhZ2UgYXJyYXkgdG8gY292ZXIgdGhlIGVudGlyZSByYW5nZSBvZiB0aGUKPiAg
ICBkZXNjcmliZWQgVk1BLgo+Cj4gKyogbW1hcF9hY3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxf
cGFnZXMoKSAtIE1hcHMgYSBkaXNjb250aWd1b3VzIHJhbmdlIG9mCj4gKyAgYHN0cnVjdCBwYWdl
YCBwb2ludGVycyBvdmVyIHRoZSBWTUEuIFRoZXkgbXVzdCBzcGFuIGZyb20gdGhlIHN0YXJ0IG9m
IHRoZSBWTUEsCj4gKyAgYnV0IG1heSB0ZXJtaW5hdGUgcHJpb3IgdG8gdGhlIGVuZCAobGVhdmlu
ZyB0aGUgcmVtYWluZGVyIHVubWFwcGVkKS4KPiArCj4gICoqTk9URToqKiBUaGUgYGBhY3Rpb25g
YCBmaWVsZCBzaG91bGQgbmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1bGF0ZWQgZGlyZWN0bHksCj4g
IHJhdGhlciB5b3Ugb3VnaHQgdG8gdXNlIG9uZSBvZiB0aGVzZSBoZWxwZXJzLgo+ICsKPiArRGlz
Y29udGlndW91cyBBY3Rpb25zCj4gKz09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArU29tZSBh
Y3Rpb25zIGNhbiBiZSBwZXJmb3JtZWQgYWNyb3NzIGRpc2NvbnRpZ3VvdXMgcmFuZ2VzLgo+ICsK
PiArTWFwIGtlcm5lbCBwYWdlcwo+ICstLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtUbyBtYXAga2Vy
bmVsIHBhZ2VzIGRpc2NvbnRpZ3VvdXNseSwgeW91IG11c3QgcHJvdmlkZSBob29rcyB1c2luZyBg
YHN0cnVjdAo+ICtkaXNjb250aWdfa2VybmVsX3BhZ2Vfb3BzYGA6Cj4gKwo+ICsuLiBjb2RlLWJs
b2NrOjogQwo+ICsKPiArICAgIHN0cnVjdCBkaXNjb250aWdfa2VybmVsX3BhZ2Vfb3BzIHsKPiAr
ICAgICAgICBpbnQgKCppbml0KSh2b2lkICp2bV9wcml2YXRlX2RhdGEsIHZvaWQgKipwcml2YXRl
KTsKPiArICAgICAgICBpbnQgKCpnZXQpKHN0cnVjdCBkaXNjb250aWdfa2VybmVsX3BhZ2Vfc3Rh
dGUgKnN0YXRlKTsKPiArICAgIH07Cj4gKwo+ICtUaGUgYGBpbml0YGAgaG9vayBpcyBvcHRpb25h
bCBhbmQgYWxsb3dzIHN0YXRlIHRvIGJlIGVzdGFibGlzaGVkIGJlZm9yZSB0aGUKPiArb3BlcmF0
aW9uIHN0YXJ0cywgZm9yIGluc3RhbmNlIHRha2luZyBhIHJlZmVyZW5jZSBjb3VudC4gTm90aGlu
ZyBpcyBpbnZva2VkCj4gK2FmdGVyIHRoZSBvcGVyYXRpb24sIHNvIGBgaW5pdGBgIG11c3Qgbm90
IGxlYXZlIGxvY2tzIGhlbGQsIGFuZCBzdGF0ZSB0aGF0IG11c3QKPiArYmUgcmVsZWFzZWQgb25j
ZSB0aGUgbWFwcGluZyBnb2VzIGF3YXkgc2hvdWxkIGJlIHJlbGVhc2VkIGluCj4gK2Bgdm1fb3Bz
LT5jbG9zZWBgLgo+ICsKPiArVGhlIGBgaW5pdGBgIGhvb2ssIGlmIHByb3ZpZGVkLCBpcyBpbnZv
a2VkIHByaW9yIHRvIHRoZSBvcGVyYXRpb24gc3RhcnRpbmcuIEl0Cj4gK21heSB1cGRhdGUgd2hh
dCBpcyBwb2ludGVkIHRvIGJ5IGBgdm1fcHJpdmF0ZV9kYXRhYGAgYW5kL29yIGBgcHJpdmF0ZWBg
LiBJZiBhbgo+ICtlcnJvciBpcyByZXR1cm5lZCwgdGhlbiB0aGUgb3BlcmF0aW9uIGlzIGFib3J0
ZWQuIFRoZSBgYHByaXZhdGVgYCBmaWVsZCBjYW4gYmUKPiArcmVhc3NpZ25lZC4KPiArCj4gKyoq
Tk9URToqKiBUaGUgb3BlcmF0aW9uIG1heSBzbGVlcCBiZXR3ZWVuIGludm9jYXRpb25zIG9mIGBg
Z2V0YGAsIHNvIGxvY2tzCj4gK25lZWRlZCB0byBzdGFiaWxpc2Ugc3RhdGUgbXVzdCBiZSB0YWtl
biBhbmQgcmVsZWFzZWQgd2l0aGluIGVhY2ggaG9vay4KPiArCj4gK1RoZSBgYGdldGBgIGhhbmRs
ZXIgaXMgdGhlIGtleSBtZWFucyB0aHJvdWdoIHdoaWNoIHRoZSBvcGVyYXRpb24gaXMKPiArZXhl
Y3V0ZWQuIFRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBvcGVyYXRpb24gaXMgcHJvdmlkZWQgdGhy
b3VnaCBgYHN0cnVjdAo+ICtkaXNjb250aWdfa2VybmVsX3BhZ2Vfc3RhdGVgYDoKPiArCj4gKy4u
IGNvZGUtYmxvY2s6OiBDCj4gKwo+ICsgICAgc3RydWN0IGRpc2NvbnRpZ19rZXJuZWxfcGFnZV9z
dGF0ZSB7Cj4gKyAgICAgICAgLyogTWFwIHN0YXRlLiAqLwo+ICsgICAgICAgIHVuc2lnbmVkIGxv
bmcgc3RhcnQ7ICAgICAgICAgICAgLyogU3RhcnQgYWRkcmVzcyBvZiBWTUEuICovCj4gKyAgICAg
ICAgdW5zaWduZWQgbG9uZyBlbmQ7ICAgICAgICAgICAgICAvKiBFbmQgYWRkcmVzcyBvZiBWTUEu
ICovCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOyAgICAgICAgICAgICAvKiBUaGUgY3Vy
cmVudCBhZGRyZXNzIHRvIGJlIG1hcHBlZC4gKi8KPiArICAgICAgICBwZ29mZl90IHBnb2ZmOyAg
ICAgICAgICAgICAgICAgIC8qIFRoZSBjdXJyZW50IHBnb2ZmIHRvIGJlIG1hcHBlZC4gKi8KPiAr
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzX21hcHBlZDsgIC8qIFRoZSBudW1iZXIgb2Yg
cGFnZXMgbWFwcGVkLiAqLwo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXNfcmVtYWlu
OyAgLyogVGhlIG51bWJlciBvZiBwYWdlcyByZW1haW5pbmcuICovCj4gKwo+ICsgICAgICAgIC8q
IFVzZXItZGVmaW5lZCBzdGF0ZS4gKi8KPiArICAgICAgICB2b2lkICp2bV9wcml2YXRlX2RhdGE7
ICAgICAgICAgIC8qIFZNQSBwcml2YXRlIGRhdGEuICovCj4gKyAgICAgICAgdm9pZCAqcHJpdmF0
ZTsgICAgICAgICAgICAgICAgICAvKiBNYXBwaW5nIHByaXZhdGUgZGF0YS4gKi8KPiArCj4gKyAg
ICAgICAgLyogVXNlcnMgc2hvdWxkIG5vdCB0b3VjaCB0aGVzZSwgdXNlIGRpc2NvbnRpZ19rZXJu
ZWxfbWFwXyooKSBoZWxwZXJzLiAqLwo+ICsgICAgICAgIC4uLiBpbnRlcm5hbCBmaWVsZHMgLi4u
Cj4gKyAgICB9Owo+ICsKPiArV2l0aCBgYHByaXZhdGVgYCBiZWluZyBhbiBhZGRpdGlvbmFsIHVz
ZXItY29udHJvbGxhYmxlIHN0YXRlIHZhcmlhYmxlLAo+ICtpbml0aWFsaXNlZCB2aWEgYGBtbWFw
X2FjdGlvbl9tYXBfZGlzY29udGlnX2tlcm5lbF9wYWdlcygpYGAsIGFuZAo+ICtgYHZtX3ByaXZh
dGVfZGF0YWBgIGJlaW5nIGVxdWFsIHRvIHRoZSBgYGRlc2MtPnByaXZhdGVfZGF0YWBgIGZpZWxk
IHNldCBpbgo+ICt0aGUgYGBtbWFwX3ByZXBhcmUoKWBgIGhvb2suCj4gKwo+ICtJbiB0aGUgYGBn
ZXRgYCBob29rLCB0aGUgdXNlciBtdXN0IGNob29zZSBob3cgdG8gbWFwIGtlcm5lbCBwYWdlczoK
PiArCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9hYm9ydCgpYGAgLSBDYWxsIHRoaXMgdG8g
YWJvcnQgdGhlIG9wZXJhdGlvbiwgd2hhdGV2ZXIKPiArICBoYXMgYmVlbiBtYXBwZWQgc28gZmFy
IHdpbGwgYmUgcmV0YWluZWQsIHRoZSByZXN0IG9mIHRoZSBtYXBwaW5nIHdpbGwgU0lHQlVTCj4g
KyAgaWYgYWNjZXNzZWQuCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9wYWdlKClgYCAtIE1h
cHMgYSBzaW5nbGUgcGFnZSwgY29ycmVjdGx5IGhhbmRsaW5nCj4gKyAgY29tcG91bmQgcGFnZXMg
KGlmIHRoZSBjb21wb3VuZCBwYWdlIGlzIGJpZ2dlciB0aGFuIHRoZSByZW1haW5pbmcgcGFnZXMg
aW4gdGhlCj4gKyAgVk1BLCB0aGVuIG9ubHkgdGhvc2UgcGFnZXMgdGhhdCBmaXQgd2lsbCBiZSBt
YXBwZWQpLiBGb3IgYSBjb21wb3VuZCBwYWdlLCB0aGUKPiArICBoZWFkIHBhZ2UgbXVzdCBiZSBw
YXNzZWQuCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9wYWdlX3JhbmdlKClgYCAtIE1hcCBh
biBhcnJheSBvZiBwYWdlcyBvZiBhIHNwZWNpZmllZAo+ICsgIHNpemUuIEFzIHdpdGggYSBjb21w
b3VuZCBwYWdlLCBpZiBtb3JlIHBhZ2VzIGFyZSBzcGVjaWZpZWQgdGhhbiByZW1haW4gaW4KPiAr
ICB0aGUgVk1BIHRoZW4gb25seSB0aG9zZSB0aGF0IGZpdCB3aWxsIGJlIG1hcHBlZC4KPiArCj4g
K0lmIGFuIGVycm9yIGFyaXNlcyBhZnRlciBgYGluaXRgYCBzdWNjZWVkZWQsIHRoZSBjb3JlIHVu
bWFwcyB0aGUgVk1BLCBpbnZva2luZwo+ICtgYHZtX29wcy0+Y2xvc2VgYCBpZiBzZXQsIHdoaWNo
IGlzIHRoZXJlZm9yZSB0aGUgcGxhY2UgdG8gcmVsZWFzZSBhbnkgc3RhdGUKPiArdGhhdCBgYGlu
aXRgYCBlc3RhYmxpc2hlZC4KPgo+IC0tCj4gMi41NS4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
