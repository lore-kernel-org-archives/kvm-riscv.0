Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1C8C88E4A
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDUtqSzR0h1Hk1ITzIoaGz8FDjMgDXm9CQHq0afLaQ8=; b=3lfOqqgSu3Tf+s
	90nNSuNtDAQp9cm0gDHm7pG6TmtuhfEBlSAOIifmmOqFK56FWzwPKH3584c82iISOBQIt4ZxpBO+H
	nnblHkjMLCPJkYrajbTVHx37etZyD42UrmHJoxuC8TaiIpt74mf8MhsnWrjeirc1nW1KG38rOBayG
	GgMyugzqZg6gP4k48/5cS036WIoftofU86c/auEh3v+wbjTr62UcVeNgdOAvd/iurBj2JyaIHkHVz
	g5C7wV3ZgWqdJ6opE8/R9x1lwGAaA2xeEmI+On2po4ng4sqZIh0l/CNLdVga6rb85Omxipge5sFBI
	GAIG480Sy7xd//d5MWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z56-0000000GSwc-2FwP;
	Fri, 11 Sep 2026 11:06:08 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z51-0000000GSv0-1kGP;
	Fri, 11 Sep 2026 11:06:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E75961F8BB;
	Fri, 11 Sep 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789124755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mCvWKSyOXghSRjrUIO25WhTluktNhI1ZIzrUisSCzog=;
	b=mwIigjyH85mOyKyDVXiVISSPm5WD3X0MP0365zfajWOkcWSuPmB2ARy/C5YHIzZl3SzDbc
	mexaobbpaHz9iWGcTvThfd3zMOtaWRmJiSjzZdg8xpZbcyM68ZMswW5SZPVvyxE5Mk7Slc
	/YYukJn/1TLBc8A1dWlsFiL2rvGZo4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789124755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mCvWKSyOXghSRjrUIO25WhTluktNhI1ZIzrUisSCzog=;
	b=b+7SUHz3bESEaqJoCQKVGmpl3KrUrunJsFD9TELjfIDfQGfJXAJcfCB1Y/yJszE2SdjUyI
	hA5MPiO3ytWkRLDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789124750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mCvWKSyOXghSRjrUIO25WhTluktNhI1ZIzrUisSCzog=;
	b=M6mKBOHbiTWHmrq4OaTeygTN+927bG8HXBCzz3Y4jYZpN6W2TIiMwt5mhZdYJylNuC/eiN
	276E04tyvopmopDYC/DjhTeHmHxTFJuP6nRvia45UtqLQRXbvqIOWCXqMt6H3llZgBfxVy
	F5cdouDM8VEETMkpv1vrbWcWH10Fe/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789124750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mCvWKSyOXghSRjrUIO25WhTluktNhI1ZIzrUisSCzog=;
	b=Bkf9+hFx/ERl6em/gPGKeoPFenHrChRVNOZRCzaiyvdKpzPFysgsyvTYq0CeN+eOGKeIpz
	kWOLNVOPOZL3xYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C59E132D3;
	Fri, 11 Sep 2026 11:05:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qc6PFovgo2rzKAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Sep 2026 11:05:47 +0000
Message-ID: <d8683667-55d5-4d77-9dcb-19e49b3dc3c6@suse.de>
Date: Fri, 11 Sep 2026 13:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/39] fbdev: defio: assert FBINFO_VIRTFB, drop VM_IO, add
 VM_MIXEDMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-rdma@vger.kernel.org, selinux@vger.kernel.org,
 linux-sound@vger.kernel.org, bpf@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 fuse-devel@lists.linux.dev
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-18-dacf19cce22b@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-18-dacf19cce22b@kernel.org>
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:liam@infradead.org,m:jannh@google.com,m:pfalcato@suse.de,m:surenb@google.com,m:mhocko@suse.com,m:dennis.dalessandro@cornelisnetworks.com,m:jgg@ziepe.ca,m:stephen.smalley.work@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:dgilbert@interlog.com,m:James.Bottomley@HansenPartnership.com,m:jayalk@intworks.biz,m:simona@ffwll.ch,m:deller@gmx.de,m:peterx@redhat.com,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:bp@alien8.de,m:mark.rutland@arm.com,m:riel@surriel.com,m:juri.lelli@redhat.com,m:airlied@gmail.com,m:npiggin@gmail.com,m:arnd@arndb.de,m:osalvador@suse.de,m:willy@infradead.org,m:jack@suse.cz,m:catalin.marinas@arm.com,m:anup@brainfault.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:davem@davemloft.net,m:andreas@gaisler.com,m:viro@zeniv.linux.org.uk,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m
 :gourry@gourry.net,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,s:linux-mm@kvack.org,s:youngjun.park@lge.com,s:chengming.zhou@linux.dev,s:qi.zheng@linux.dev,s:shakeel.butt@linux.dev,s:dri-devel@lists.freedesktop.org,s:kvm-riscv@lists.infradead.org,s:linux-arm-kernel@lists.infradead.org,s:linux-riscv@lists.infradead.org,s:fuse-devel@lists.linux.dev,s:kvmarm@lists.linux.dev,s:linuxppc-dev@lists.ozlabs.org];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:url,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,infradead.org,google.com,suse.de,suse.com,lwn.net,linuxfoundation.org,cornelisnetworks.com,ziepe.ca,paul-moore.com,gmail.com,perex.cz,iogearbox.net,nvidia.com,linux.alibaba.com,linux.dev,arm.com,interlog.com,HansenPartnership.com,intworks.biz,ffwll.ch,gmx.de,redhat.com,alien8.de,linux.intel.com,surriel.com,linaro.org,arndb.de,suse.cz,linux.ibm.com,brainfault.org,dabbelt.com,eecs.berkeley.edu,davemloft.net,gaisler.com,zeniv.linux.org.uk,intel.com,sk.com,gourry.net,tencent.com,huaweicloud.com,lge.com,cmpxchg.org,zte.com.cn,szeredi.hu];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL3ijnbkbqi8cy7pgpqkbn6f4y)];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[134];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_040603_757804_E1AE90F4 
X-CRM114-Status: GOOD (  22.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpBbSAwOC4wOS4yNiB1bSAyMjowMSBzY2hyaWViIExvcmVuem8gU3RvYWtlcyAoQVJNKToKPiBD
dXJyZW50bHkgYWxsIGRyaXZlcnMgd2hpY2ggdXNlIGRlZmlvIGFsbG9jYXRlIHN5c3RlbSBtZW1v
cnkuIEFsbCBvZiB0aGVtCj4gYWxzbyBzZXQgRkJJTkZPX1ZJUlRGQiwgb3RoZXIgdGhhbiBzc2Qx
MzA3ZmIsIGhvd2V2ZXIgdGhpcyBkcml2ZXIgYWxsb2NhdGVzCj4gc3lzdGVtIFJBTSwgc28gc2lt
cGx5IGZhaWxlZCB0byBzZXQgdGhpcyBmbGFnIHdoZW4gaXQgb3VnaHQgdG8uCj4KPiBUaGlzIHBh
dGNoIHNldHMgRkJJTkZPX1ZJUlRGQiBvbiBzc2QxMzA3ZmIgcHJvYmUsIHRoZW4gZHJvcHMgc2V0
dGluZyBWTV9JTwo+IGluIGZiX2RlZmVycmVkX2lvX21tYXAoKSBhbmQgaW5zdGVhZCByZXF1aXJl
cyBGQklORk9fVklSVEZCIHRvIGJlIHNldCwKPiBlcnJvcmluZyBvdXQgd2l0aCBhIGtlcm5lbCB3
YXJuaW5nIGlmIG5vdC4KPgo+IFRoZSBsb2dpYyByZXF1aXJlcyBhIHBhZ2UgZnJvbSB0aGUgZHJp
dmVyIGFuZCBzaW5jZSBjb21taXQgMWVjYmM3ZGQyOTAyCj4gKCJmYmRldi9kZWZlcnJlZC1pbzog
QWx3YXlzIGNhbGwgZ2V0X3BhZ2UoKSBmb3IgZnJhbWVidWZmZXIgcGFnZXMiKSBoYXMKPiBhbHdh
eXMgcmVxdWlyZWQgaXQgdG8gYmUgcmVmY291bnRlZCwgc28gdGhpcyB3YXMgaW1wbGljaXRseSBh
bHJlYWR5IHRoZQo+IGNhc2UuCj4KPiBGaW5hbGx5IHRoaXMgcGF0Y2ggc2V0cyBWTV9NSVhFRE1B
UCwgYXMgdGhlIGxvZ2ljIGlzIG1hcHBpbmcKPiBrZXJuZWwtYWxsb2NhdGVkIG1lbW9yeSBzbyB0
aGlzIGlzIGFwcHJvcHJpYXRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KCj4gLS0tCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJf
ZGVmaW8uYyB8IDYgKysrLS0tCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jICAg
ICB8IDIgKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMKPiBpbmRleCBmZDAwYjg2ZTFh
ZTYuLmZiMzU5ZWNjMzk2NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJfZGVmaW8uYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jCj4g
QEAgLTM2NiwxMyArMzY2LDEzIEBAIGludCBmYl9kZWZlcnJlZF9pb19tbWFwKHN0cnVjdCBmYl9p
bmZvICppbmZvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIHsKPiAgIAl2bWEtPnZt
X3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQodm1hLT52bV9wYWdlX3Byb3QpOwo+ICAgCj4g
KwlpZiAoV0FSTl9PTl9PTkNFKCEoaW5mby0+ZmxhZ3MgJiBGQklORk9fVklSVEZCKSkpCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4gICAJaWYgKCF0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkpCj4g
ICAJCXJldHVybiAtRUlOVkFMOwo+ICAgCj4gICAJdm1hLT52bV9vcHMgPSAmZmJfZGVmZXJyZWRf
aW9fdm1fb3BzOwo+IC0Jdm1fZmxhZ3Nfc2V0KHZtYSwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlRE
VU1QKTsKPiAtCWlmICghKGluZm8tPmZsYWdzICYgRkJJTkZPX1ZJUlRGQikpCj4gLQkJdm1fZmxh
Z3Nfc2V0KHZtYSwgVk1fSU8pOwo+ICsJdm1fZmxhZ3Nfc2V0KHZtYSwgVk1fTUlYRURNQVAgfCBW
TV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVApOwo+ICAgCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0g
aW5mby0+ZmJkZWZpb19zdGF0ZTsKPiAgIAo+ICAgCWZiX2RlZmVycmVkX2lvX3N0YXRlX2dldChp
bmZvLT5mYmRlZmlvX3N0YXRlKTsgLyogcmVsZWFzZWQgaW4gdm1hLT52bV9vcHMtPmNsb3NlKCkg
Ki8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKPiBpbmRleCBjNGZkZWNhZmQ4NTYuLjk1ODUxNGEz
NTQzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYwo+IEBAIC03NjMsNiArNzYzLDggQEAg
c3RhdGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAg
IAlpbmZvLT5maXguc21lbV9zdGFydCA9IF9fcGEodm1lbSk7Cj4gICAJaW5mby0+Zml4LnNtZW1f
bGVuID0gdm1lbV9zaXplOwo+ICAgCj4gKwlpbmZvLT5mbGFncyA9IEZCSU5GT19WSVJURkI7Cj4g
Kwo+ICAgCWZiX2RlZmVycmVkX2lvX2luaXQoaW5mbyk7Cj4gICAKPiAgIAlpMmNfc2V0X2NsaWVu
dGRhdGEoY2xpZW50LCBpbmZvKTsKPgoKLS0gCi0tClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICkZy
YW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55LCB3d3cuc3VzZS5jb20KR0Y6
IEpvY2hlbiBKYXNlciwgQW5kcmV3IE1jRG9uYWxkLCAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
CgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
