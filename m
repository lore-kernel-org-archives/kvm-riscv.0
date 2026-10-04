Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D31CA5FE6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SN497xXIgGwlYb/RR27u/OFuaJZKarH2Sy+JhCGRU3Q=; b=H/1Jf4zDkl/I6L
	g5TUn26daYlXAnLNkF9LxnBUwz0Zdr3yHNFzzFqs94I9gLrzoGwK3yeYMfo7+/PC24AejFqkpbQjE
	fGWeLLGl3nMMRHyFbGKQZC+Xpu3Fki2GAE9UyxCGpIxsoMYTjOPvrLPzuw1L/gbNywd+5qZu3PuWg
	BceOoK7NlsDh5wFI5PMmVFA2zY8bdn9p8kWIeVTkYLxhhXa+5NphJKLKNESgCUPmwB2NL2rBjTAWO
	HjGr/tdWa2l0jfSbQ79UEtpbihxfBiUCKdvtfGhbHMo+UHNjrmJ1eUZBm5NHkFukXB8QmSDiVhysd
	H7X8qdtIjf88KGNt03Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPrD-0000000F6Mb-0UqR;
	Sun, 04 Oct 2026 17:18:39 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPr2-0000000F6Jp-3QYo
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:18:34 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-533202fe429so245881cf.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134308; cv=none;
        d=google.com; s=arc-20260327;
        b=WKViwHDTY5SbLfb7+1ic8yN9E3ckuqa9WlKK7sJeHlpO+XXJO56y7Xe2onv6DcxbAn
         J0TaNXfR+am3Ji0EiJg7jDRImj6ZWloTaNrIizpeGi9H4Cn5RCaCD9bHk2JtsUyFb69I
         SxFyj8sIZmd5S1etzaSUMyU6GpEBpf04y+LgCguukHJ4q7U6dyIYe8sDHxbHYG8NVyTW
         dpRmVJY0o+nIMeI1yYytXkhnkuW9TplYUy1GHAoWGYCdxOieesjSn6qDGIF5dmetzK6Y
         xY5FPdzzBWyi0YhrgpFP30z6NbGwFGlUPiiEtWPNQrWk5smT3WiPNmDisLNDg0TnnTQd
         KRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        fh=NJXIs98qvJD1AMxMp5wp2VzSvHi18/mlAsj7bN/aHNo=;
        b=hdwMQtJ2GuFTNmj7iFF13obcA1yXNK1B0UrrrajnNF5+kZ/eG9ryIBtXutEgWt0t68
         WtV95INQFN+/sSXH7POjklUz2Q57ro8kMjnVqpJDDouSNQ0vHGZVQE7VRCU3Sr7fijMY
         9EyMQIXf5VwVA7XlnFiRFjo8yAoZ0o22fCTAkDZ9j4oOQiLuUVMWHtf+9kjadhSoDic6
         qbtyHOX0Gxk/xEhwwl4PbyEwdvB81Miy6IZEQJIr6NDlkr1KY+pfymvceNp5KOJn9/C6
         /7Lz8gcchlSU8Z3+OQR39R6De6RW7Jh+yoFAOabHBusOwwDT8QPH6bHRmUxLFcAzWalt
         XurQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134308; x=1791739108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        b=WyeeO1S2I3CLfyqIYiUVNOSIzftXf2J1CvIkV0lFi9V6EdRjJi/VBSDYCWs87zm346
         quKyWpe4PYRZlsRYVV2oHrKMxke7V5O7pqxmn2Rm0dtfeHfvAQSbQM7z+o1sFm5Zfxa9
         7hxmHt3mFv0/b+b66x8V6qugJ0CjNFoUvaWBJHP8mF11XftFnZMH1WktWSxrfDh1JMTv
         4prSrV/M+q2Rf8L/x9L8Nj0oSnLOeTrvCoG+qx3KHWPpX4qDcTrR5kHmxQZzmAwT7BF+
         qDrk7qw1aOm7ostwTOtMvDNF5lnVyGkvI82FGlVX4aym8LTxFmDOF6tnxzZjPetyqwWq
         cb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134308; x=1791739108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        b=Tyx843+/NPH15umtptz75UTmfZl5351gGEqJRyoF6U6rqA7aEw3hfQT81IGlKm5oyc
         OSoMQtiqJcY/Zzqt4111+P+lFRT5He7u6VohcZN1QQrSOW9lIi2C6xfwz+7C5Tq3JcwO
         ixeQFNWNUSEZNRT223c89bVrWzwxyr6I5fyHGc7z5L1FjxYyvhnf9LVGb/dChc6WrIq5
         X5VeJ6Pj0CpMzkB7xPP64VCb8t8LXv8Obub2dsEVJW/REnIJeOQ9+B4gtxP6to283uyI
         00jijvh2b787EGUPms0n6+S2sfEblma+4ZWS6yaPKMCi07ms4YUu77SZTX0hOGuHCZ3K
         R5jA==
X-Forwarded-Encrypted: i=1; AKwUvBwGGdcsYJbomLn2y1/PU+g83vXYmZgPujbFIdfbrfvhwXA57XuQIxL3K0+89xTmGuiwUJfsK/ci8OY=@lists.infradead.org
X-Gm-Message-State: AFuF++l81QVAH2ibnZIva/3c+GyQ3BzwzrOA/YmBsYmH9blDSSUT2hqt
	wOhzPvGNtuJD0ZPsQpgqTLCAVumDcQo3x5fjdgpTxpXlY18VfzKyvWhiO0JPgF6mm4+lz20vCHV
	lMLQ4hWPYcY52P0cjd+OkX7kD0C27qhik5hEYP3tk
X-Gm-Gg: AYBFou2raly599+uxKgrqNBHHyqtyMgEqkpxGxshp5NKtvnLi5m9dHyZ8iVxtz0erF+
	MzMeQvZ7/LuLMgMLZkppv/s4VAOXiaMZdZKv+Ezr6UY+SVh0wCHaBwXtDL61ZYVsPSUSodUuc0U
	rocR7FRHm7nGshD7bXL1544vzTtsOdKVga1isOUTXOrVM5DDXWbyp2U8jgOcy/lJK6fj32F9BmK
	MNGAtV/z4lsiji1YAZ2qVj7e4KzdbBj9mjIZnMjOOhtorhaLmaAvz4B3pGb/sLn3xnDQ6o250Rq
	arQj6GUHwXBeNCaVkc7q7FFEMlNH7T32gu4alNYI/zvnqbLP7vp1oD/k
X-Received: by 2002:a05:622a:1b91:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-535146ce3e1mr16649101cf.4.1791134306600; Sun, 04 Oct 2026
 10:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-9-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-9-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:18:15 -0700
X-Gm-Features: AclHuK_AcqqolMBhSGAldWSHQHOOTkitmvHnvL2po1Vgiun02DenXRmiOZ3VQUs
Message-ID: <CAJuCfpFkfK4gvBPVoSiSdKs_3LR-0-dw_08BVxs-NqCvQK0-Mg@mail.gmail.com>
Subject: Re: [PATCH v4 09/38] drivers/usb/mon: update to use mmap_prepare +
 map kernel pages
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101830_375877_E41A70DE 
X-CRM114-Status: GOOD (  34.79  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM24oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBSZXBsYWNlIHRoZSBkZXByZWNhdGVkIC5tbWFwIGhv
b2sgd2l0aCBpdHMgcmVwbGFjZW1lbnQgLm1tYXBfcHJlcGFyZS4gQXMKPiBwYXJ0IG9mIHRoaXMg
Y2hhbmdlLCBhZGRpdGlvbmFsbHkgdGFrZSB0aGUgYXBwcm9hY2ggb2YgbWFwcGluZyBwYWdlcyB1
cG9uCj4gbW1hcCByYXRoZXIgdGhhbiBwcm92aWRpbmcgYSBmYXVsdCBoYW5kbGVyLgo+Cj4gVGhl
IHBhZ2Ugc3BhbiBjYW5ub3QgYmUgbXV0YXRlZCB3aGVuIGFuIG1tYXAgbWFwcGluZyBpcyBpbiBw
bGFjZSwgc28gdGhpcwo+IGlzIHNhZmUgdG8gZG8gaW4gYWR2YW5jZSAodGhlIE1PTl9JT0NUX1JJ
TkdfU0laRSBpb2N0bCBvcGVyYXRpb24gZXhpdHMKPiAtRUJVU1kgaWYgaXQncyBhdHRlbXB0ZWQs
IGdhdGVkIGJ5IHRoZSBycC0+bW1hcF9hY3RpdmUgcmVmZXJlbmNlIGNvdW50KS4KPgo+IFV0aWxp
c2UgdGhlIG5ld2x5IGludHJvZHVjZWQgbW1hcF9hY3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxf
cGFnZXMoKSB0byBkbwo+IHRoaXMsIHdoaWNoIGFsbG93cyBmb3IgaXRlcmF0aW9uIG92ZXIgcGFn
ZXMgaW4gbW9uX2Jpbl9kaXNjb250aWdfZ2V0KCkuCj4KPiBtb25fYmluX2Rpc2NvbnRpZ19pbml0
KCkgaW5jcmVtZW50cyB0aGUgcnAtPm1tYXBfYWN0aXZlIHJlZmVyZW5jZSBjb3VudCB0bwo+IHN0
YWJpbGlzZSBwYWdlIHNwYW5zLiBTaG91bGQgYW4gZXJyb3IgYXJpc2UgdGhlIGNvcmUgdW5tYXBz
IHRoZSBWTUEgYW5kCj4gbW9uX2Jpbl92bWFfY2xvc2UoKSBkcm9wcyB0aGUgcmVmZXJlbmNlIGFn
YWluLgo+Cj4gVGhlIHZtX29wcy0+Y2xvc2UgaG9vayBpbXBsZW1lbnRlZCBpbiBtb25fYmluX3Zt
YV9jbG9zZSgpIHdpbGwgZW5zdXJlCj4gY29ycmVjdCByZWZlcmVuY2UgY291bnQgYXJpdGhtZXRp
YyB1cG9uIHVubWFwICh3aXRoIG1vbl9iaW5fdm1hX29wZW4oKQo+IGFjY291bnRpbmcgZm9yIHNw
bGl0dGluZykuCj4KPiBUaGUgZXhpc3Rpbmcgc2VtYW50aWNzIGFyZSBhbGwgcmV0YWluZWQsIGlu
Y2x1ZGluZyBub3QgbWFwcGluZyBwYXN0IHRoZQo+IHJhbmdlIG9mIGF2YWlsYWJsZSBwYWdlcywg
d2l0aCBhIFNJR0JVUyBiZWluZyByYWlzZWQgaW4gYSB1c2VybGFuZCBwcm9jZXNzCj4gdGhhdCBh
dHRlbXB0cyB0byBhY2Nlc3MgcGFzdCB0aGlzIHBvaW50Lgo+Cj4gVWx0aW1hdGVseSBpbnNlcnRf
cGFnZSgpIGlzIGludm9rZWQgdG8gaW5zZXJ0IGVhY2ggcGFnZSwgd2hpY2ggaW5jcmVtZW50cwo+
IHRoZSByZWZlcmVuY2UgY291bnQgb24gZWFjaCBtYXBwZWQgcGFnZS4gVGhpcyBtaW1pY3Mgd2hh
dCB3YXMgYmVpbmcgZG9uZQo+IHByZXZpb3VzbHksIG9ubHkgd2UgcHJlLW1hcCB0aGUgZW50aXJl
IHJhbmdlIHJhdGhlciB0aGFuIGRvaW5nIHNvIG9uCj4gZGVtYW5kLgo+Cj4gVGhlIGV4aXN0aW5n
IGZhdWx0IGhhbmRsZXIgZGlkIG5vdGhpbmcgdGhhdCByZXF1aXJlZCBkZW1hbmQgcGFnaW5nLCBh
bmQgd2FzCj4gcHJlc3VtYWJseSBpbXBsZW1lbnRlZCB0aGlzIHdheSBmb3IgaGlzdG9yaWNhbCBy
ZWFzb25zLgo+Cj4gT25lIGJlaGF2aW91cmFsIGRpZmZlcmVuY2U6IHBhZ2VzIGFyZSBubyBsb25n
ZXIgZmF1bHRlZCBpbiBvbiBkZW1hbmQsIHNvIGEKPiBwYWdlIGRpc2NhcmRlZCB3aXRoIE1BRFZf
RE9OVE5FRUQgaXMgbm90IHJlcG9wdWxhdGVkIGFuZCBhIHN1YnNlcXVlbnQKPiBhY2Nlc3MgcmFp
c2VzIFNJR0JVUywgYXMgd2l0aCBvdGhlciBwcmUtcG9wdWxhdGVkIGtlcm5lbCBtYXBwaW5ncy4K
Pgo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5v
cmc+CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4K
Cgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9tb24vbW9uX2Jpbi5jIHwgODIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L21vbi9tb25fYmluLmMgYi9kcml2ZXJzL3VzYi9tb24vbW9uX2Jpbi5jCj4gaW5kZXggNjg3ZjZh
ODk4MWYzLi45ZDAwYjIxYTgxNTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91c2IvbW9uL21vbl9i
aW4uYwo+ICsrKyBiL2RyaXZlcnMvdXNiL21vbi9tb25fYmluLmMKPiBAQCAtMTIxOSw2ICsxMjE5
LDE1IEBAIG1vbl9iaW5fcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBvbGxfdGFibGVf
c3RydWN0ICp3YWl0KQo+ICAgICAgICAgcmV0dXJuIG1hc2s7Cj4gIH0KPgo+ICtzdGF0aWMgdm9p
ZCBfX21vbl9iaW5fdm1hX29wZW4oc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCkKPiArewo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgcnAtPm1tYXBfYWN0aXZlKys7Cj4gKyAg
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFncyk7Cj4gK30KPiAr
Cj4gIC8qCj4gICAqIG9wZW4gYW5kIGNsb3NlOiBqdXN0IGtlZXAgdHJhY2sgb2YgaG93IG1hbnkg
dGltZXMgdGhlIGRldmljZSBpcwo+ICAgKiBtYXBwZWQsIHRvIHVzZSB0aGUgcHJvcGVyIG1lbW9y
eSBhbGxvY2F0aW9uIGZ1bmN0aW9uLgo+IEBAIC0xMjI2LDY0ICsxMjM1LDc5IEBAIG1vbl9iaW5f
cG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBvbGxfdGFibGVfc3RydWN0ICp3YWl0KQo+
ICBzdGF0aWMgdm9pZCBtb25fYmluX3ZtYV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwID0gdm1hLT52bV9wcml2
YXRlX2RhdGE7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4gLSAgICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+IC0gICAgICAgcnAtPm1tYXBfYWN0
aXZlKys7Cj4gLSAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFn
cyk7Cj4gKyAgICAgICBfX21vbl9iaW5fdm1hX29wZW4ocnApOwo+ICB9Cj4KPiAtc3RhdGljIHZv
aWQgbW9uX2Jpbl92bWFfY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRp
YyB2b2lkIF9fbW9uX2Jpbl92bWFfY2xvc2Uoc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCkKPiAg
ewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPgo+IC0gICAgICAgc3RydWN0IG1vbl9y
ZWFkZXJfYmluICpycCA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICAgICAgICAgc3Bpbl9sb2Nr
X2lycXNhdmUoJnJwLT5iX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJwLT5tbWFwX2FjdGl2ZS0t
Owo+ICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+
ICB9Cj4KPiAtLyoKPiAtICogTWFwIHJpbmcgcGFnZXMgdG8gdXNlciBzcGFjZS4KPiAtICovCj4g
LXN0YXRpYyB2bV9mYXVsdF90IG1vbl9iaW5fdm1hX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1m
KQo+ICtzdGF0aWMgdm9pZCBtb25fYmluX3ZtYV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKPiAgewo+IC0gICAgICAgc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCA9IHZtZi0+dm1h
LT52bV9wcml2YXRlX2RhdGE7Cj4gKyAgICAgICBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwID0g
dm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gKwo+ICsgICAgICAgX19tb25fYmluX3ZtYV9jbG9zZShy
cCk7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qg
bW9uX2Jpbl92bV9vcHMgPSB7Cj4gKyAgICAgICAub3BlbiA9ICAgICBtb25fYmluX3ZtYV9vcGVu
LAo+ICsgICAgICAgLmNsb3NlID0gICAgbW9uX2Jpbl92bWFfY2xvc2UsCj4gK307Cj4gKwo+ICtz
dGF0aWMgaW50IG1vbl9iaW5fZGlzY29udGlnX2luaXQodm9pZCAqdm1fcHJpdmF0ZV9kYXRhLCB2
b2lkICoqcHJpdmF0ZSkKPiArewo+ICsgICAgICAgc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCA9
IHZtX3ByaXZhdGVfZGF0YTsKPiArCj4gKyAgICAgICAvKiBEcm9wcGVkIGJ5IG1vbl9iaW5fdm1h
X2Nsb3NlKCkgb24gdW5tYXAsIGluY2x1ZGluZyBvbiBlcnJvci4gKi8KPiArICAgICAgIF9fbW9u
X2Jpbl92bWFfb3BlbihycCk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBtb25fYmluX2Rpc2NvbnRpZ19nZXQoc3RydWN0IGRpc2NvbnRpZ19rZXJuZWxfcGFnZV9z
dGF0ZSAqc3RhdGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtb25fcmVhZGVyX2JpbiAqcnAgPSBz
dGF0ZS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQsIGNo
dW5rX2lkeDsKPiAtICAgICAgIHN0cnVjdCBwYWdlICpwYWdlcHRyOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPgo+ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnJwLT5iX2xvY2ss
IGZsYWdzKTsKPiAtICAgICAgIG9mZnNldCA9IHZtZi0+cGdvZmYgPDwgUEFHRV9TSElGVDsKPiAr
Cj4gKyAgICAgICBvZmZzZXQgPSBzdGF0ZS0+cGdvZmYgPDwgUEFHRV9TSElGVDsKPiAgICAgICAg
IGlmIChvZmZzZXQgPj0gcnAtPmJfc2l6ZSkgewo+ICAgICAgICAgICAgICAgICBzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICAgICAgICAgIHJldHVy
biBWTV9GQVVMVF9TSUdCVVM7Cj4gKyAgICAgICAgICAgICAgIGRpc2NvbnRpZ19rZXJuZWxfbWFw
X2Fib3J0KHN0YXRlKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4g
ICAgICAgICBjaHVua19pZHggPSBvZmZzZXQgLyBDSFVOS19TSVpFOwo+IC0gICAgICAgcGFnZXB0
ciA9IHJwLT5iX3ZlY1tjaHVua19pZHhdLnBnOwo+IC0gICAgICAgZ2V0X3BhZ2UocGFnZXB0cik7
Cj4gLSAgICAgICB2bWYtPnBhZ2UgPSBwYWdlcHRyOwo+ICsgICAgICAgZGlzY29udGlnX2tlcm5l
bF9tYXBfcGFnZShzdGF0ZSwgcnAtPmJfdmVjW2NodW5rX2lkeF0ucGcpOwo+ICsKPiAgICAgICAg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJwLT5iX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJl
dHVybiAwOwo+ICB9Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVj
dCBtb25fYmluX3ZtX29wcyA9IHsKPiAtICAgICAgIC5vcGVuID0gICAgIG1vbl9iaW5fdm1hX29w
ZW4sCj4gLSAgICAgICAuY2xvc2UgPSAgICBtb25fYmluX3ZtYV9jbG9zZSwKPiAtICAgICAgIC5m
YXVsdCA9ICAgIG1vbl9iaW5fdm1hX2ZhdWx0LAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRpc2Nv
bnRpZ19rZXJuZWxfcGFnZV9vcHMgbW9uX2Rpc2NvbnRpZ19vcHMgPSB7Cj4gKyAgICAgICAuaW5p
dCA9IG1vbl9iaW5fZGlzY29udGlnX2luaXQsCj4gKyAgICAgICAuZ2V0ID0gbW9uX2Jpbl9kaXNj
b250aWdfZ2V0LAo+ICB9Owo+Cj4gLXN0YXRpYyBpbnQgbW9uX2Jpbl9tbWFwKHN0cnVjdCBmaWxl
ICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBtb25fYmlu
X21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4gLSAgICAgICAv
KiBkb24ndCBkbyBhbnl0aGluZyBoZXJlOiAiZmF1bHQiIHdpbGwgc2V0IHVwIHBhZ2UgdGFibGUg
ZW50cmllcyAqLwo+IC0gICAgICAgdm1hLT52bV9vcHMgPSAmbW9uX2Jpbl92bV9vcHM7Cj4gKyAg
ICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlscCA9IGRlc2MtPmZpbGU7Cj4KPiAtICAgICAgIGlm
ICh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpCj4gKyAgICAgICBpZiAodm1hX2Rlc2NfdGVzdChk
ZXNjLCBWTUFfV1JJVEVfQklUKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPgo+
IC0gICAgICAgdm1fZmxhZ3NfbW9kKHZtYSwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QLCBW
TV9NQVlXUklURSk7Cj4gLSAgICAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IGZpbHAtPnByaXZh
dGVfZGF0YTsKPiAtICAgICAgIG1vbl9iaW5fdm1hX29wZW4odm1hKTsKPiArICAgICAgIGRlc2Mt
PnZtX29wcyA9ICZtb25fYmluX3ZtX29wczsKPiArICAgICAgIHZtYV9kZXNjX2NsZWFyX2ZsYWdz
KGRlc2MsIFZNQV9NQVlXUklURV9CSVQpOwo+ICsgICAgICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRl
c2MsIFZNQV9ET05URVhQQU5EX0JJVCwgVk1BX0RPTlREVU1QX0JJVCk7Cj4gKyAgICAgICBkZXNj
LT5wcml2YXRlX2RhdGEgPSBmaWxwLT5wcml2YXRlX2RhdGE7Cj4gKwo+ICsgICAgICAgbW1hcF9h
Y3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxfcGFnZXMoZGVzYywgTlVMTCwgJm1vbl9kaXNjb250
aWdfb3BzKTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtMTI5OCw3ICsxMzIyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbW9uX2ZvcHNfYmluYXJ5ID0g
ewo+ICAgICAgICAgLmNvbXBhdF9pb2N0bCA9IG1vbl9iaW5fY29tcGF0X2lvY3RsLAo+ICAjZW5k
aWYKPiAgICAgICAgIC5yZWxlYXNlID0gICAgICBtb25fYmluX3JlbGVhc2UsCj4gLSAgICAgICAu
bW1hcCA9ICAgICAgICAgbW9uX2Jpbl9tbWFwLAo+ICsgICAgICAgLm1tYXBfcHJlcGFyZSA9IG1v
bl9iaW5fbW1hcF9wcmVwYXJlLAo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQgbW9uX2Jpbl93YWl0X2V2
ZW50KHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwKQo+Cj4gLS0K
PiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
