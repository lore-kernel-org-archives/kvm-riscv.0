Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC509C9830E
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxpxInxtVDuLXNkF1+h9KtTg+ODLCTkI62J/9xFM65U=; b=IEMD2weIuElixs
	lRur6lWWoMvLap7ILE9C0lJe4YEO5Wi9IGx0njZYx+NP037aNuma/hkM50CVplpge7Sk1Nib/Nkmw
	1cs9+cAHEs62qpGqW+gbHpsz2Vayj6yL17Dfyt99lqwo+W5HWwmDsjgKQ11YzDxu4eOebBXTyRRQp
	goYvX5mIreRDPTQ6l0W9UOjsICgZLn9h6KuHrQ5IC3MUDJehJpdEzrCOa6mejnxErZ2IcVwrI6/m0
	/G/024ZXV3LansElFV1yAF270jPwiwVEcqk6AAyOtzY5dsPnDl7JMEXe502uW3CL3hlzk7xkbVkv0
	7Tqc7bXcgi5ulWwzBHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PlK-00000008rXC-0c9N;
	Wed, 23 Sep 2026 16:24:02 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PlG-00000008rVt-2pdo
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 16:24:00 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-52faa58bff5so282201cf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 23 Sep 2026 09:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180637; cv=none;
        d=google.com; s=arc-20260327;
        b=UgwnmzqYZwNUJKAUSym69k8tK99t4oM2caZRlj0s6n6dJcsTjFmQ4oPt4olAbex/Sq
         yASoskqHU6T0MBZ7rtDhzliUpbrfrLwtAIZWvdrrAvv4wWsNn8YhX5Ce55YyL6wu9Fcx
         D0bOY7Y9TaMpwOXtZNFvWxdzbovBkP4fG0OmAgC4rUOCSWzpOyqzRLP1PJUp4hOkCCHz
         hlPSL/7OtiTVOUiD459guMNz53C4UbAtAh1VWPRmnPFWYfAbK9JSCc2/aSSGPtydIG21
         3sOf63pCLjfXX85q8/PsuMVdPZvjwSMkHMrFzPhtmaILPoXiSRJxJXMavLH8fxa8sYiA
         wTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        fh=Bi+AEzBObwLcy1saBLtkRefxYuPFpi2QYC5iI0lnVIk=;
        b=XenzSnGbxCXALQ+bGKJZKJZL7bGDWdaiupZ+sc1sVQK04ghr+//9Yo5lKWZVqEatbZ
         Ek0nkAMiOJ0QQD1bvnnM6drPw5IC6pmI7ijbqZvlofDxZRKhfiWgjECTxGLaqbKOzbKQ
         j5C4mS86r5zvx0I1/w7cm6juO9+yucvU4Wh4R4VGkwdMJ8LjvBWmKZDQ2a/ix8nr4Yqm
         ZqaNwTFw89EigxNkxmLpfGcnPg+MVEG2AvqrRUZ1yWN7Qn0ux4ONdYf3ykdpWj/BvQa7
         ISiZOJu++tB0cfrguh/yyvsObK1qWAASjFV38D52ar/VJBhzNW9LVRNmsZ+sdeovDD9x
         PqgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790180637; x=1790785437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=IWtW5Wj/TrysJbQi1zraCQ7vbOomAx1fZfOjyJGz7YvtCZc5doh0JnykUttsuorsKD
         4g+4KTlK3/bSs0NmvCw/kZcLCZpKqUdYeq0G4wqsfIGYJ0RpIQBE/QzuFwfhLbw0FWES
         kWIh59b9nd50huAK145b7zU7SCU3qBLs191CdhV+LQDcLi7qyDBX4WwzadQfM0ytIybI
         bNmbRZ5jm8q1QK53fteZSjD1rHio5HsTHLsBsDHuMpT/aIZkzsURojwAQy4uarCYyYn/
         SxZOBQLFzFE5NH0ymJwJlwfG1AP2YLYdVmUazO75PImL/3OvogLug9HLtQA9wr176Kjq
         rcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180637; x=1790785437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=sgGA3Y/ikf6Ir9ErMVq7vGLRL7QdSDuEnytkz0vI2MezEo17uv7tlNOCc9MwIfK0K4
         iScLqUvaAabF9uoLEjGxSzhbvgQEh0wSLuk9eh7mABrXCWMznihFleo+ta9TbzRMGFRV
         Nuzu7s9rKpqfG6j1uGhH6y5jy4Kd/y0T1ejPnzBpt3v9m5+3UtSoKhcpnI450rpQFjZJ
         PIs3ydjtXppRDUh/5xk0Jz5IsZBdCl8oFHie7piCiTl9AEwnktdIMwb8iuVmDUQTKoaH
         ctDS0+C7shxyuScfrd6qYz6ZtbVXJoBlQ4BwIIOX8IzJViInkaUAj8gc5PBKUZ1Y4tCl
         zAkw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7gdroe40lA7j2xcyvWyVUn7Jy5iEQOWBwrxXRt4qCoLF2vHofvL6b2Dm9WcSvBNvUi3fCJjSTZ0=@lists.infradead.org
X-Gm-Message-State: AFuF++mlcAxdHewNfPff7LyT786NYRGbJS6urg0RxMyvC9+bSGVbfxil
	/tWFvCEKn0PzDQjtQNzlHywNE9pmS4/AQmsbvbhBpvQFNG1Syh0SVKefmk1OksG0CVifyhhfr2V
	h+rCyHd0RqiB6kMttayNczTk7AB2Sk0rmrF/wtiIN
X-Gm-Gg: AYBFou2loUKIGtZ/utCVQ63sS1VXRMdoYpQatXLjiMxO7mVBMW+XgRCAJsTLbQdfVi6
	yS6NKNFk8sDBkyI2PJbbYWdUem1izpEquPsLE8wqJyqEMyQvPlCKu/706bx5NHLbS9GkHwrDcr8
	kHbG1OJNu4Go+OgfwvehBDIQF8yk7mP63LOY/4YRt9OWsK/GAaP5Ogf/4OQBvtasqmZPGT87VTR
	IWjLGW22wSRawtl9UEf2PCThzRJYYQbPx3fh8KeIWjhpO3pbXcZcUKonr1E7mKKeWxFlerMTlRe
	NHrrY1hsUPPuieIGabe7NqXwNd8iAbKKWnG9hKK75lCAtUO6HaibjubPHgJgdQCa7ok8rxvnjVF
	UWxMJMW5aYg==
X-Received: by 2002:a05:622a:609:b0:531:282:6560 with SMTP id
 d75a77b69052e-532f9d4a86emr439391cf.15.1790180636277; Wed, 23 Sep 2026
 09:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 09:23:45 -0700
X-Gm-Features: AcwNN1U-1rGp6GFHFrF0qqhOHTzivX5krrdmfBch0hMHABT_yaCwm6D93D-Dyz8
Message-ID: <CAJuCfpE0WCr1Kp=+4EVJB7UdbH22HuCouOEtGMNCL+a8TnCQPQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use vma_[flags_]can_merge()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_092359_049826_B7413DD6 
X-CRM114-Status: GOOD (  30.28  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgOToyNOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBWTUFfU1BF
Q0lBTF9GTEFHUyBjaGVjayBpbiB0aGUgVk1BIG1lcmdlIGxvZ2ljIHdpdGgKPiB0d28gbmV3IGZ1
bmN0aW9ucyB2bWFfZmxhZ3NfY2FuX21lcmdlKCkgYW5kIHZtYV9jYW5fbWVyZ2UoKSBhbmQgdXBk
YXRlIHRoZQo+IG1lcmdlIGxvZ2ljIHRvIHVzZSB0aGUgZm9ybWVyLgo+Cj4gVGhpcyBhYnN0cmFj
dHMgdGhlIGNoZWNrIGFuZCBleHByZXNzZXMgaXQgaW4gdGVybXMgb2YgdGhlIGRlc2lyZWQgYmVo
YXZpb3VyCj4gcmF0aGVyIHRoYW4gYW4gYXJiaXRyYXJ5IGFuZCBjb25mdXNpbmcgVk1BIGZsYWcu
Cj4KPiBUaGlzIGFsc28gbGF5cyB0aGUgZ3JvdW5kd29yayBmb3IgbWFraW5nIGZ1cnRoZXIgaW1w
cm92ZW1lbnRzIGluIFZNQSBmbGFnCj4gdXNhZ2UuCj4KPiBBbHNvIHVwZGF0ZSB0aGUgdXNlcmxh
bmQgVk1BIHRlc3RzIHRvIHJlZmxlY3QgdGhlIGNoYW5nZS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlIGludGVuZGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBn
b29nbGUuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwo+ICBtbS92bWEuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTkgKysrKysrKysrKystLS0tLS0tLQo+ICB0b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1
cC5oIHwgIDUgKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAo+IGluZGV4IDk2OTU5NDA3NGZkMi4uNjgyNTBlY2U0MjE5IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0x
NjEyLDYgKzE2MTIsMjcgQEAgc3RhdGljIGlubGluZSBib29sIHZtYV9pc19zaGFyZWRfbWF5d3Jp
dGUoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICByZXR1cm4gaXNf
c2hhcmVkX21heXdyaXRlKCZ2bWEtPmZsYWdzKTsKPiAgfQo+Cj4gKy8qKgo+ICsgKiB2bWFfZmxh
Z3NfY2FuX21lcmdlKCkgLSBEbyB0aGUgc3BlY2lmaWVkIFZNQSBmbGFncyBwZXJtaXQgdGhlIFZN
QSB0byBiZQo+ICsgKiBtZXJnZWQgd2l0aCBhbm90aGVyPwo+ICsgKiBAZmxhZ3M6IFRoZSBWTUEg
ZmxhZ3MgdG8gdGVzdC4KPiArICogUmV0dXJuczogdHJ1ZSBpZiB0aGUgZmxhZ3MgcGVybWl0IG1l
cmdpbmcsIGZhbHNlIG90aGVyd2lzZS4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFf
ZmxhZ3NfY2FuX21lcmdlKGNvbnN0IHZtYV9mbGFnc190ICpmbGFncykKPiArewo+ICsgICAgICAg
cmV0dXJuICF2bWFfZmxhZ3NfdGVzdF9hbnlfbWFzayhmbGFncywgVk1BX1NQRUNJQUxfRkxBR1Mp
Owo+ICt9Cj4gKwo+ICsvKioKPiArICogdm1hX2Nhbl9tZXJnZSgpIC0gRG8gQHZtYSdzIGZsYWdz
IHBlcm1pdCBpdCB0byBiZSBtZXJnZWQgd2l0aCBhbm90aGVyIFZNQT8KPiArICogQHZtYTogVGhl
IFZNQSB0byB0ZXN0Lgo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHRoZSBmbGFncyBwZXJtaXQgbWVy
Z2luZywgb3RoZXJ3aXNlIGZhbHNlLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBib29sIHZtYV9j
YW5fbWVyZ2UoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3sKPiArICAgICAg
IHJldHVybiB2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2bWEtPmZsYWdzKTsKPiArfQo+ICsKPiAgLyoq
Cj4gICAqIHZtYV9rZXJuZWxfcGFnZXNpemUgLSBEZWZhdWx0IHBhZ2Ugc2l6ZSBncmFudWxhcml0
eSBmb3IgdGhpcyBWTUEuCj4gICAqIEB2bWE6IFRoZSB1c2VyIG1hcHBpbmcuCj4gZGlmZiAtLWdp
dCBhL21tL3ZtYS5jIGIvbW0vdm1hLmMKPiBpbmRleCA0Yjc0YjQ4YzI5YjcuLjA1ZDJjNjc2Njcy
ZSAxMDA2NDQKPiAtLS0gYS9tbS92bWEuYwo+ICsrKyBiL21tL3ZtYS5jCj4gQEAgLTkyNCwxMyAr
OTI0LDE0IEBAIHN0YXRpYyBfX211c3RfY2hlY2sgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFf
bWVyZ2VfZXhpc3RpbmdfcmFuZ2UoCj4KPiAgICAgICAgIHZtZy0+c3RhdGUgPSBWTUFfTUVSR0Vf
Tk9NRVJHRTsKPgo+ICsgICAgICAgaWYgKCF2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2bWctPnZtYV9m
bGFncykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICAgICAgICAgLyoKPiAtICAg
ICAgICAqIElmIGEgc3BlY2lhbCBtYXBwaW5nIG9yIGlmIHRoZSByYW5nZSBiZWluZyBtb2RpZmll
ZCBpcyBuZWl0aGVyIGF0IHRoZQo+IC0gICAgICAgICogZnVydGhlcm1vc3QgbGVmdCBvciByaWdo
dCBzaWRlIG9mIHRoZSBWTUEsIHRoZW4gd2UgaGF2ZSBubyBjaGFuY2Ugb2YKPiAtICAgICAgICAq
IG1lcmdpbmcgYW5kIHNob3VsZCBhYm9ydC4KPiArICAgICAgICAqIElmIHRoZSByYW5nZSBiZWlu
ZyBtb2RpZmllZCBpcyBuZWl0aGVyIGF0IHRoZSBmdXJ0aGVybW9zdCBsZWZ0IG9yCj4gKyAgICAg
ICAgKiByaWdodCBzaWRlIG9mIHRoZSBWTUEsIHRoZW4gd2UgaGF2ZSBubyBjaGFuY2Ugb2YgbWVy
Z2luZyBhbmQgc2hvdWxkCj4gKyAgICAgICAgKiBhYm9ydC4KPiAgICAgICAgICAqLwo+IC0gICAg
ICAgaWYgKHZtYV9mbGFnc190ZXN0X2FueV9tYXNrKCZ2bWctPnZtYV9mbGFncywgVk1BX1NQRUNJ
QUxfRkxBR1MpIHx8Cj4gLSAgICAgICAgICAgKCFsZWZ0X3NpZGUgJiYgIXJpZ2h0X3NpZGUpKQo+
ICsgICAgICAgaWYgKCFsZWZ0X3NpZGUgJiYgIXJpZ2h0X3NpZGUpCj4gICAgICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+Cj4gICAgICAgICBpZiAobGVmdF9zaWRlKQo+IEBAIC0xMTUyLDkgKzEx
NTMsMTEgQEAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFfbWVyZ2VfbmV3X3JhbmdlKHN0cnVj
dCB2bWFfbWVyZ2Vfc3RydWN0ICp2bWcpCj4KPiAgICAgICAgIHZtZy0+c3RhdGUgPSBWTUFfTUVS
R0VfTk9NRVJHRTsKPgo+IC0gICAgICAgLyogU3BlY2lhbCBWTUFzIGFyZSB1bm1lcmdlYWJsZSwg
YWxzbyBpZiBubyBwcmV2L25leHQuICovCj4gLSAgICAgICBpZiAodm1hX2ZsYWdzX3Rlc3RfYW55
X21hc2soJnZtZy0+dm1hX2ZsYWdzLCBWTUFfU1BFQ0lBTF9GTEFHUykgfHwKPiAtICAgICAgICAg
ICAoIXByZXYgJiYgIW5leHQpKQo+ICsgICAgICAgaWYgKCF2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2
bWctPnZtYV9mbGFncykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAg
ICAgIC8qIFZNQXMgd2l0aCBubyBwcmV2L25leHQgYXJlIHVubWVyZ2VhYmxlLiAqLwo+ICsgICAg
ICAgaWYgKCFwcmV2ICYmICFuZXh0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+
ICAgICAgICAgY2FuX21lcmdlX2xlZnQgPSBjYW5fdm1hX21lcmdlX2xlZnQodm1nKTsKPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaCBiL3Rvb2xzL3Rlc3Rpbmcv
dm1hL2luY2x1ZGUvZHVwLmgKPiBpbmRleCAxNmMwOWRhYzU5ZDkuLjJmZDQyMjc4OTcxNyAxMDA2
NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1cC5oCj4gKysrIGIvdG9vbHMv
dGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaAo+IEBAIC0xNjQ3LDMgKzE2NDcsOCBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgZmlsZV9pc19kZXZfemVybyhjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiAg
ewo+ICAgICAgICAgcmV0dXJuIGZpbGUgJiYgZmlsZS0+Zl9vcCA9PSAmemVyb19mb3BzOwo+ICB9
Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2ZsYWdzX2Nhbl9tZXJnZShjb25zdCB2bWFf
ZmxhZ3NfdCAqZmxhZ3MpCj4gK3sKPiArICAgICAgIHJldHVybiAhdm1hX2ZsYWdzX3Rlc3RfYW55
X21hc2soZmxhZ3MsIFZNQV9TUEVDSUFMX0ZMQUdTKTsKPiArfQo+Cj4gLS0KPiAyLjU1LjAKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
