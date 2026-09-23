Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE1C98304
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQacUnSdRI2Y1OLl/JKnvtOWnt81Jy7tgI310U8YFWM=; b=e/5WRDbLRI6dxY
	quOZaJlQrgiwAWJZuNhTThOJ8UbLb/H9l+qVOfwZzef1Aa9s4qrEUBwy30KwCteXwB7Sb0o1e1/o6
	VoeQ93o86OgAMQM93UA15x0S2jYXpMmxX3aIpM6bhHdSTpv8AkCI7Pk4UsdVxwQziU03CqtS+k3rV
	oG82YHrui0/9boWDmBgbdOO6zDuO1ipTGy3qPDFXFX0XoRGzxAyLJWse3sN8Cb5XBot4ikLXsxG02
	/XTlP5IU8KJGvlXpwzRMAYV9YBaDwAQful6Z/b6wg9+Gw+dUCnxQWQDdwgNMWQUVwHxTywRUcdXPr
	7NfTXOlZBv2E6KuWuoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PXh-00000008qHu-1AAY;
	Wed, 23 Sep 2026 16:09:57 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PXe-00000008qGl-0nR6
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 16:09:56 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-530e8c6fb80so271491cf.1
        for <kvm-riscv@lists.infradead.org>; Wed, 23 Sep 2026 09:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790179793; cv=none;
        d=google.com; s=arc-20260327;
        b=F/AeQ7Ijxwua7MzITveqk3xOihV+pQW3NotdX5IeAYFmbE2H1Kp9+QVvHXeY457B5e
         9W+U6eIjT+BtgEn9n0/zjrAgv2OuRPdXessvBIrFngVk0H+mIWNTw7G4uUgGoIEu7sdm
         aY0dCo/JWvHYf62jV9V0S5vrpwKH3XqrUjpKym8wJg4MZUZ/QSQZOtbcD1oCf02ApWRw
         E0MslZkyrvsyk4xVMrZCb76y6UBirtSmdlSktdrM2GxhcWi+BWxgckpDL2rEz6eITJXB
         QO8M1q8YQoxpe55nb+cNjZnySAJ1ZLgmZPgelsojU6c5ugXouzl3kWE8iKym8mSfsonU
         EknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        fh=D2pKzMWCIlPZx9lYYNRVn5EJ52+ZqVqIJEHVzw6T3gw=;
        b=WaDbMAnr42hsNErA/tYJgzGrjKBJdKACivA5swGU6VHXm3ieUu0xQrtxkO84IO1z5d
         hOLIfjE7ezeBu0UoEMuMGXol0zjkN4EcCfz6TkEZc336thD6llBZFKI1/wv676tMwzqm
         bd1Ba61ni+fmWYgham5iOEuTizQTNpNasW7/DQ3dN+NmyNmtrfIRj0jqGgqumA+oDne2
         tV2UwpiIwbo/+/UJfq5a0217NWQ9atELLt11kRFruNBGr/9l7PQnibDa+Qk5HkZR5lM0
         XdXb+EbAuli9IuLfBZ2eAtjDHqLanhYsnRKopw2O2/+WuUgzWtgHZfXpUANfL6tH4g4w
         N/yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790179793; x=1790784593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        b=WnyMCg61S8EKnZJhW6lBYgbLMwiT+UHZqHhqOk3v3Equ6I5xTgL+BrvWfTEhj22xx0
         oqD4RFqq/8fQTKa6eK8qowUQXN3Pend+wmpYJvyWcVfO6mclGGbEDvL+fIRN/DQH4keu
         umcxmHTNUBY+Z7zxY4lHzUC1M4MM+9hyeNx3kMEmTv0+M3og6VdJtsTJwAaYNgicnPrh
         XzPHcY9DJmD01X09kMLWeZCYHWnpuBOExPVvU+NB9ziZ/f6Vh9/64b7fAljx3bW13qYG
         Sf1mHapkILR8QHXGub2REdrSJnMNPw4bCUcE0bgw/y5F9i57qlw5Z4O0EDYSnUhGc3CN
         S0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179793; x=1790784593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        b=KB96kd7DzxAWMZE967Abye8EQdXMJJiPameVrXVTpItQYDPPI/Vx/XUdFfbTwqNhHD
         s4cuiJBdN1MyNzD28EVsmiOIvM3Ast6Krv9Nxs8EnDGiyUUZRT6cWLk8LOfpjRMi+Xa5
         52gJoYurFrGHoT4F6WA8QTrfqBYtYLBECcZjsiyjtHG6nOqcMw4qZ2iWsuWMM622nYxI
         6GYJSMqc2tWyxFmvog3oGD23cWZjfZJfNXz2ZzF93+mIT5IOQVz0lgDkqC1NCjS5vJBx
         8//6wI/CxnEOSaME5FKz+01fnRFAi9Yqx5jugsX0Y4uW7j/Ys4bdW9FqqV47A8RfOjG5
         3Ywg==
X-Forwarded-Encrypted: i=1; AKwUvBzWJiau0uP7qEMUfya4+nuw2snTLDox5hCWSMdWIh1Ass3KnO0lIdqsvRkSyvwCEPhPEf3qXuTGPjk=@lists.infradead.org
X-Gm-Message-State: AFuF++nYO2W/Znm4+T/OijY5TLmscO8mhX3AEf6MGpD3DCC30CtyfkCZ
	O2/Jubr+GQKhNzsoaOzyCvf2UislBJYJS9uBQDLpMV+rdmOsFOekUNLX/MenN+/U8IkNohVirYT
	pHGNYYKgj7M0J+KQ8XLkGiQkv9hh+Dv0WNKQZWrrb
X-Gm-Gg: AYBFou3tMYTRTXSwf+wiWceD7U/0jAPz6e14D2k/LAKLTc804sdwBq/XCD6pWBclrxd
	e0k3korNt9U6EFSmwlylKzjDnZA4tQ91/fiGVdI8FGxHCrf19+j5sylhcZP0enrcl0he7T/P32w
	8UrXQgHM0qHwvtTer2tGunAPRfRSTJi12ESHNp1bOsztj+ZFSLBRTknLPXQKCzhhjiweZPQIwvo
	BRGUfDNf6FtBdYH4Hsg6BLImH1H+7ZvMt6P6yyxfXoEw3OUAllV0zkuNs7pi/ZnwElKtGPGcsYR
	UFhXbBRxi6ifg+kesCQ4BI1D9mNQRP50A0KSQZ9ij4qgrZi8TFahDnHHrEpVAQraK/fkNc5hvBs
	pTDF7g8OwfxA=
X-Received: by 2002:a05:622a:591b:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-532f8b3b7d0mr1642301cf.0.1790179791981; Wed, 23 Sep 2026
 09:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
 <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com> <arP0oJgrgZlgtrb6@gremlin>
In-Reply-To: <arP0oJgrgZlgtrb6@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 09:09:38 -0700
X-Gm-Features: AclHuK-pjLwt7GcAJrmXZc-kWYiEiXZ02rewi0rtPA2ju4vBD2OPEsiN1JlMpG0
Message-ID: <CAJuCfpFPPGaK-grNx9qiQOhzAXbxU+SO+95Fht1571TGREx2oQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_090954_318274_28CDD36B 
X-CRM114-Status: GOOD (  35.96  )
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgODo1NOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMDg6MzI6
NDNBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gT24gVGh1LCBTZXAgMTcs
IDIwMjYgYXQgOToyNOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPgo+ID4gPiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRvIG1hbmlwdWxhdGUgVk1B
IGZpZWxkcyBpZiB3ZSBhbGxvY2F0ZWQgYSBuZXcgVk1BLAo+ID4gPiByYXRoZXIgdGhhbiBtZXJn
ZWQgaXQuCj4gPiA+Cj4gPiA+IFZNQSBtZXJnaW5nIGRvZXMgbm90IGNvbXBhcmUgdm1fb3BzIG9y
IHZtX3ByaXZhdGVfZGF0YSwgc28gYSBtZXJnZWQgVk1BCj4gPiA+IGtlZXBzIGl0cyBvd24sIHdo
aWNoIGlzIGFsc28gd2hhdCB0aGUgbGVnYWN5IGZfb3AtPm1tYXAgcGF0aCBkb2VzIHNpbmNlIGl0
Cj4gPiA+IG5ldmVyIHRvdWNoZXMgYW4gZXhpc3RpbmcgVk1BLiBQcmV2aW91c2x5IHNldF92bWFf
dXNlcl9kZWZpbmVkX2ZpZWxkcygpCj4gPiA+IG92ZXJ3cm90ZSB0aGUgbWVyZ2VkIFZNQSdzIGZp
ZWxkcyB3aXRoIHRob3NlIHNldCBmb3IgdGhlIG5ldyBtYXBwaW5nLiBJbgo+ID4gPiBwcmFjdGlj
ZSB0aGVzZSBhcmUgdGhlIHNhbWUgdmFsdWVzLCB3aXRoIHJhcmUgZXhjZXB0aW9ucyBzdWNoIGFz
IHNobWVtCj4gPiA+IHNlbGVjdGluZyB2bV9vcHMgYmFzZWQgb24gd2hldGhlciB0aGUgZmlsZSBo
YXMgYmVlbiB1bmxpbmtlZCwgc28gbm8KPiA+ID4gdXNlci12aXNpYmxlIGNoYW5nZSBpcyBleHBl
Y3RlZC4KPiA+ID4KPiA+ID4gTWFrZSB0aGlzIGRlcGVuZGVuY3kgZXhwbGljaXQsIGFuZCBhZGRp
dGlvbmFsbHkgY29uc3RpZnkgaGF2ZV9tbWFwX3ByZXBhcmUKPiA+ID4gd2hpbGUgd2UncmUgaGVy
ZS4KPiA+Cj4gPiBUaGUgZmFjdCB0aGF0IHdlIG1pZ2h0IGJlIG92ZXJyaWRpbmcgYXR0cmlidXRl
cyBvZiBhbiBleGlzdGluZyBWTUEKPiA+IHRoYXQgd2UgbWVyZ2VkIHdpdGggaXMgdGVjaG5pY2Fs
bHkgYSBidWcgZXZlbiBpZiB3ZSBuZXZlciBoaXQgaXQsCj4gPiByaWdodD8gSWYgc28sIHNob3Vs
ZCB3ZSBoYXZlOgo+ID4KPiA+IEZpeGVzOiBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5l
dyAubW1hcF9wcmVwYXJlKCkgZmlsZSBjYWxsYmFjayIpCj4KPiBJdCdzIG5vdCBhIGJ1ZywgaXQg
aXMgYW4gaW4tYnVpbHQgYXNzdW1wdGlvbiB0aGF0IHRoZSBzdGF0ZSB1c2VkIHRvIGFzc2Vzcwo+
IG1lcmdlYWJpbGl0eSBpbXBsaWVzIHRoZSBzYW1lIHByb3BlcnRpZXMuCgpIbW0uIFdoYXQgcHJl
dmVudHMgdHdvIFZNQXMgd2l0aCBkaWZmZXJlbnQgdm1fcHJpdmF0ZV9kYXRhIG1lbWJlcnMgdG8K
YmUgbWVyZ2VkPyBJSVVDIGlzX21lcmdlYWJsZV92bWEoKSBkb2VzIG5vdCBjaGVjayB2bV9wcml2
YXRlX2RhdGEuIEluCnN1Y2ggYSBjYXNlIHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcygpIHdv
dWxkIG92ZXJyaWRlCnZtX3ByaXZhdGVfZGF0YSBvZiBhbiBleGlzdGluZyBWTUEsIG5vPwoKPgo+
IEFuZCBpZiBpdCB3YXMsIGl0J2QgbmVlZCBmaXhpbmcgYSBkaWZmZXJlbnQgd2F5IChjaGVjayB0
aGUgZmllbGQgZm9yIGluc3RhbmNlKQo+IGFuZCB3b3VsZCBhcHBseSB0byB0aGUgbGVnYWN5IG1t
YXAgaG9vayBhbHNvLgo+Cj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIGZvciB0aGUgc2VyaWVzIHRo
b3VnaC4KPgo+ID4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPgo+IFRoYW5rcyEKPgo+ID4KPiA+ID4gLS0tCj4gPiA+
ICBtbS92bWEuYyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL21tL3ZtYS5jIGIvbW0v
dm1hLmMKPiA+ID4gaW5kZXggZmE3ODRmMDY5ZGE0Li40Yjc0YjQ4YzI5YjcgMTAwNjQ0Cj4gPiA+
IC0tLSBhL21tL3ZtYS5jCj4gPiA+ICsrKyBiL21tL3ZtYS5jCj4gPiA+IEBAIC0yODk0LDcgKzI4
OTQsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX21tYXBfcmVnaW9uKHN0cnVjdCBmaWxlICpm
aWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgc3RydWN0IG1t
X3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPiA+ID4gICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSA9IE5VTEw7Cj4gPiA+IC0gICAgICAgYm9vbCBoYXZlX21tYXBfcHJlcGFyZSA9
IGZpbGUgJiYgZmlsZS0+Zl9vcC0+bW1hcF9wcmVwYXJlOwo+ID4gPiArICAgICAgIGNvbnN0IGJv
b2wgaGF2ZV9tbWFwX3ByZXBhcmUgPSBmaWxlICYmIGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZTsK
PiA+ID4gICAgICAgICBWTUFfSVRFUkFUT1Iodm1pLCBtbSwgYWRkcik7Cj4gPiA+ICAgICAgICAg
Y29uc3QgcGdvZmZfdCBhbm9uX3Bnb2ZmID0gYWRkciA+PiBQQUdFX1NISUZUOwo+ID4gPiAgICAg
ICAgIE1NQVBfU1RBVEUobWFwLCBtbSwgJnZtaSwgYWRkciwgbGVuLCBwZ29mZiwgYW5vbl9wZ29m
Ziwgdm1hX2ZsYWdzLCBmaWxlKTsKPiA+ID4gQEAgLTI5MzcsNyArMjkzNyw3IEBAIHN0YXRpYyB1
bnNpZ25lZCBsb25nIF9fbW1hcF9yZWdpb24oc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiA+ID4gICAgICAgICAgICAgICAgIGFsbG9jYXRlZF9uZXcgPSB0cnVlOwo+ID4g
PiAgICAgICAgIH0KPiA+ID4KPiA+ID4gLSAgICAgICBpZiAoaGF2ZV9tbWFwX3ByZXBhcmUgJiYg
IW1hcF9pc19hbm9uKCZtYXApKQo+ID4gPiArICAgICAgIGlmIChoYXZlX21tYXBfcHJlcGFyZSAm
JiBhbGxvY2F0ZWRfbmV3ICYmICFtYXBfaXNfYW5vbigmbWFwKSkKPiA+ID4gICAgICAgICAgICAg
ICAgIHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcyh2bWEsICZtYXApOwo+ID4gPgo+ID4gPiAg
ICAgICAgIF9fbW1hcF9jb21wbGV0ZSgmbWFwLCB2bWEpOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAy
LjU1LjAKPiA+ID4KPgo+IC0tCj4gQ2hlZXJzLCBMb3JlbnpvCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
