Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4AAC88E6F
	for <kvm-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 19:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9G0X+1BZ9zQW74DCkWSDaEqy/d5xaHbr6yz7iXxVv70=; b=ICFmLyqH5ASTu5
	pm35AwQMZGHK3yWKEPxdjVSBhRsa6owm1MCB1lW0E4P6cY57w3dAmgfOT02I+Mq9G/QGk6sWEcw78
	3JZAcFFvq8HIwo0HGELcr1Rsi56Ac6FnYcVkNKLddVSnkVjIfKLKsIfVEi9tuDs5anj9Xag6dP0iM
	z2tz9qxyyydd9LxhEpWgycRDYS1dE0CjEDH3xIfYaQgN/1G3APAYjceLpRWLtQeYsv7bx9rYLp5ha
	Lq5CRa0yq2Q9MfFDPd9np5XlZZFYXFv+QdOSNcBpOlNVFWmTmUBTSyRQG0bBBLRbT9bUf8wzp3EsC
	Q8SIz1C5VEpmddlFWiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CoF-00000004Z9r-3TI0;
	Mon, 14 Sep 2026 19:57:47 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CoB-00000004Z8d-44Fj
	for kvm-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 19:57:46 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e25400so1944928b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 14 Sep 2026 12:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415862; cv=none;
        d=google.com; s=arc-20260327;
        b=hr3XPqOVFJDC6jxN1WDMan4j8WrOuYFcShTjVZrcnroy8J4oPJSF0Ra6yq9NMjbRkc
         y5siCR5CiZ8gdX8nQaJj2J9n/HaXEir39pkUEAP55P6xxHpeqxcPVrvvtZXSxoPAyBFc
         6L2UWytW44puPgryIrTz/h4umLFOdcfaASKTfSfT+2iQD7Ok+osGlUBvFhoCopUa6vXk
         PU9Gd6xXB7Itf4H2XB+3zy1NqkXvWtVlj2rpZ6vvSSFeuz7RlCXaR4LSA+QZ2lVe9W8N
         GKbIoPiOdKgHrXwceAccJl7xDvDXDuho1AHE14R7oY8PUevQ9HVq9ovxYlkJZ/EuFNoi
         ISPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        fh=G0i/UCipxyLgdPmuaC+XLvS1VaYVlB4+0RcpfJsI3fk=;
        b=ZArV39TPeXM9dADHqDFN0cxd7XZA4CI9Jjbm/Z5ZdDqrE8cgvB1vbWcPUM+nnruEMl
         ZIB0BfO4k6q9OfrvPjQ/iUa3Mhu67w/WaQHOPtF8UgQMnLMa7SJebZkC0EHZCdFI/GFc
         QXUIV6lHa0QQEY6DZ00I/GtV7n2ISjGMU5/PaluTHKHiT1y/zEw86hqYRdHgJtmM5c2V
         ukSZU1A1kWjI2lDg4hIamgmZqXVQeNzPnAxnZxVUQmfBgpqO6ooIzzDPlaE+DFGvPdZI
         HSKKMk1g7DWpr5joHdpDwE4FNB5jiknYAGgWPpEiT38hzYqs4U9lpq0JJIJfFiSmaqsE
         XaHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789415862; x=1790020662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=Fu4vLPfdKiHe0zbMfDVKo+o6WDbjVb76jd0ktrD78/thJO+OyNOyVaZBudSLyTU2YU
         chuHupgO0Xf0h+euMSMYZY9WMIFrzyDRuHlUlzjW6g+VFt9ClZB7d2qy78qRKVuGwOcz
         z7EMvTc4L04Oqn6dnPIN/6ig4j+MrUMAPSUcBY1wpDhVpihRBPg1XABh9vxyfMbg1MwZ
         RIdVTwN3eeqUaWogYPCBkuMY66Xhn8w8CK5GT+9YM/+a0Y4XXGEoTrls+IeKVgejSJIA
         xQ7gm7GhPt5DCgGniXGLYaR3LQX1Ag8PCevwbMKiHga16TnkNvqObhyqAAcwcJMApSmc
         ypkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415862; x=1790020662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=MSFKBemIos1njI01bj99YuSX90H3sqLPNZMv0gxzJdmK0P130LVxFYtE/vBOaFwt7P
         OBjy5mPYiGb7xQlaDY86BCR3lX6q8AtPZlCfGBH+e9EcrEp91FPnDcVb0NMTLo5hDwoO
         j5ZCLrccxlLkHRqcMLGEQ+VMBsCZsQfgpuUd5IS6200GQxIpF+3zTNG7+praY+sD+MWq
         nM/X55mvmzQwLavfHf1RSn1q2AqAsr3vX+2qvCepvgipthg4cQjr+wG7Z/8baWcB4WAb
         JwsUgvjrRuik36Q6azN7+ijpeL9KT4A8vZ5iwl3WqRICcLRDxyQWBuYs5NH0XuJ7N4UG
         A5vw==
X-Forwarded-Encrypted: i=1; AKwUvByvRw7dhwpD86VpAenqoQSMMcvTgbOMT39QinSnPXzptgGApOCo+dbO73LZTkjW+OgY1bSBtB2+RK8=@lists.infradead.org
X-Gm-Message-State: AFuF++kdeofirkSlFR2CxW0kNxxs6XeFYT4yTomhLPpEkdV/VAsxhcO7
	xfnX0XyYJWV2y5ORIQ6YI/BmMKpdbJxQPcsZ4MndKU11rlsdQaKtRmNwtqgRFrn/lUdcQVlmMH8
	LLsSTM3SATn+Hpf92ao1ndTVId+lHC4m/qgWKFMMh
X-Gm-Gg: AYBFou3c561v4FHokWSSnMhO6bMZ+Q6EBlqPWffZEGX8IV94AWfUhmAPckyVbvJ3i7M
	WwRt4NuJ/79IRLK42eB2qIHqTLemG5qAjsJf6piHNk0NyQ4FhTjDZ318t0lHLM3b+7BlV4p9pbK
	IfNLtUeZ1fQh2ytGqnoTEx8bBd0WeKTnQTZQnN+b4L1A4ntJZHU+kPAflfpaRWl4f15CBZfSDIb
	tbAIdBbR/2tlt7wxOiiqCcBCEm4OPKyM9+AYNfJjm1Ce7SokAbDP/NAE9kg4vvayQlHqHqS+mHM
	5Y1g8nO1+vJQD27111yJLkwdqtyMlAT1XWeGc7azfrOIRUcYk5Dz9slnAE4vnEIw14BpnptC+D1
	tFWcdtUZIt7o=
X-Received: by 2002:a05:6a00:18a9:b0:858:b809:6ec0 with SMTP id
 d2e1a72fcca58-86f869a920dmr8896742b3a.23.1789415862342; Mon, 14 Sep 2026
 12:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
In-Reply-To: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Sep 2026 15:57:29 -0400
X-Gm-Features: AcwNN1XaLRK0KaZAmfcRvdaBSkZOdh14LF1fb-xWULoFVhBfqyRklsdKoWBmLag
Message-ID: <CAHC9VhQ3TwdGGH6YtVyMqJX4avJwsadcRvRhAoUhCvJEHk=i=g@mail.gmail.com>
Subject: Re: [PATCH v2 12/40] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_125744_300960_93D29311 
X-CRM114-Status: GOOD (  17.32  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MDXigK9BTSBMb3JlbnpvIFN0b2FrZXMgKEFSTSkg
PGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUg
bWV0aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+IHNlbGludXhfZmls
ZXNbXSksIHlldCBzZWxfb3Blbl9wb2xpY3koKSBwZXJmb3JtcyBubyBvcGVuIG1vZGUgY2hlY2ss
IHNvIGEKPiBDQVBfREFDX09WRVJSSURFIGNhbGxlciBjYW4gb3BlbiBpdCBPX1JEV1IuIFJlamVj
dCBGTU9ERV9XUklURSBhdCBvcGVuLCBhcwo+IGtlcm5mcyBkb2VzLgo+Cj4gVGhlIGZpbGUgY2Fu
IHRoZW4gbmV2ZXIgYmUgbWFwcGVkIHdpdGggRk1PREVfV1JJVEUsIHNvIGRvX21tYXAoKSBhbHdh
eXMKPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQX1NIQVJFRCBtYXBw
aW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+IGNoZWNrIGluIHNlbF9tbWFwX3BvbGljeSgpIGNhbm5v
dCBiZSByZWFjaGVkLiBSZW1vdmUgaXQuCj4KPiBUaGlzIGFsc28gc3RvcHMgc2VsX21tYXBfcG9s
aWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBtYXBwaW5nIHRoYXQgaXMKPiBuZWl0aGVy
IGEgUEZOIG1hcCBub3IgYSBtaXhlZCBtYXAsIGFoZWFkIG9mIHRoZSBjb3JlIGVuZm9yY2luZyB0
aGF0IG9ubHkKPiBzdWNoIG1hcHBpbmdzIG1heSBkbyBzby4KPgo+IEFja2VkLWJ5OiBTdGVwaGVu
IFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53b3JrQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTog
SmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIHNlY3VyaXR5L3NlbGludXgvc2Vs
aW51eGZzLmMgfCAxMSArKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1tb29y
ZS5jb20+CgotLSAKcGF1bC1tb29yZS5jb20KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
