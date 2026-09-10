Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FCFC79FB7
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eg2JlutSXDzmZ1Gr/cTevdhz/Fo+GfdxxkKVQ8JoQFU=; b=fm0eSRlMAYwV7R
	RYblPQ0qCsu16bLxj6plh+uK4GqyDQkshkiEuUb2LkNuHRc0ZarJM8b0NkGorvKlORBKXzpQEfJUZ
	Ka2CAwgoK7uqXQbpc8O1i3/PHIg8uHJW0jdQU7O7sICPHyqLnqLcHQxQDdkJ72j1mPKvrLyfpWQup
	/vDTeT+kgK7v0q5qj4DpFDmcIq0lLU5AroSJx8oriJAjWiJ2tboRqt945D36gage1s1gDl/hxcTs4
	YSynCaU4eXQ+yx5iuGwjU29LKiNIoPcvFDrUj0FnBnIDEd4BvL3mjGhjsmB+3srWSEg74bchU7Asw
	wV2Am5Rh6oppZZRez+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YR0-0000000DY6G-3GcB;
	Thu, 10 Sep 2026 06:38:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQz-0000000DY55-36en
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 06:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=; b=BkNoC8N3u/AWtXMGOyH+cLoHFC
	m2Z2P6ZWOW5AD2O35etVKZgcBS8rv58muMQ36rZC39+kcfL3nlbYboXgbe63zMwNwRweq7o23b/TR
	Qgf7DCMb2YnCiU2IoII4VUJIgjVsTMq8a1TifDXDww4lkqHUJLDtgIAcLAd5zufX5JNmssBwcnYvT
	zspzOJnXgrmso1iQ2q52ekO3ZnAB/464XczLjSj++a88ZhFGqnOLiQVQi4tgGoP8R7KSyCNBA8M/Y
	4TXT8noDmRv+CLp7OEXX7MLVrHuWcWRFbK7BiCHpQi5hPwMv31J46YZw5Fn24/ZFSEYly5g74CKjN
	2jXXgg0g==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YQw-000000025WJ-3ff1
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:38:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso72264855ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022332; x=1789627132; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=cUALl9sDGpTVb7tdoRnaQmA3P0fyyFdpkoC12SODCoSB1d01qIgYoYesKyZj0ckgvg
         z+Jc3h41CewM13PuW+ddnXE/W5UsBFxL5jWtONDUt2UFPfnzg55teSxPR7szjuSUr3cv
         r91pmyWBR/2PDVRHftBbvsRxxfvwL03c4pCFJGgmXWIjeAeoiMAZ9inScVrUqy4rzmOg
         9JzPFFXGmaEGDIHiBFr7hbklXvjBcqowVtE5g/b0aq6F1nmftmuwC6YIQO49r3bEekx9
         FhspB1a/97vay4AgLM2GjPRqqP4jlyoKu3ypz5VxVpL3cJjWk4kj+Aojdz/5bLHKR4N1
         MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022332; x=1789627132;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=bg37cT5UUquzYl61WvvK7Ryq1HBfetwREM5Hd/dh+SKnURPMhlNBuyYhUQJpINFzWe
         sxJg4wCTeBW/mHcP9jWvNHGLTZny9ho3l9mqUYdZYpZNvPmrDG65O1zUbbXPEfaS5SIy
         Xssn3d2VIID3Ts0/afXSnfTVTA4oeoXRD08sD9t0RE7lHQsFzb07UOeFCM+qb0v+3L+8
         JqwOh6bUf1HB1EACsjfGVCo9hzy/sn3zyMSrnaQYb6h+UFZeyxUcajCxCJqEKx54t6DV
         7LPZJNdTz+UO+NWIct+2bPl5G3yN6tRB97b7GLSOLEkY3QD+xMpGmFcrjF0tEW+ihe7n
         Dopw==
X-Forwarded-Encrypted: i=1; AKwUvBwV78ihcS9IliXr8Mpw75rOwYMJuug2ww2W9o3LaQmjJVHGqlsvlIhdKdLSktCi6SsCYGFj4oOKDxc=@lists.infradead.org
X-Gm-Message-State: AFuF++mF7i7Xar+c/TkjsLWH0jFa2wGM1KW36bC0fRR8eCbLFGAcuBLN
	OnTm2oU5KJvjVLZdUKVkhFzvKZutSAlqdCZpO1ta04ggdC2oUK1+x4Mk
X-Gm-Gg: AYBFou3hQXD7q6QVoCEjp6FgCW4rrsaAJX3kMnhBxVaYmkTePkMHTeFck6yCEc2P4Ec
	ee6coJ7vgM85JP0FrujfqMH5oIGRR1XiTUGP2a/bFo4VfRvTuxdgncC008vHPWDDVoEgolSTh/6
	lxyDDImnh53BaqNraeVbxKm4NK8lepopYJ2avdNlfeX4R3ATuIcEYy2siI2+BdNq0NvLIIzoQhl
	sqlo7gosjWdr/+FlAFvQnrTbM3RUNqXSwclEs3JMvWqHf8c/DQQ7AQ/rsTUed0i3YLRkxyxb5eM
	a0AMzSDMPDM8SzRATO4fTvEULh9V3qjC7OzfopNDskqDPGd1eSkkYVXbs0wn5LAXs3XnUKEtb38
	t/P8u/IUBWDG6QqPPGkegYIYZMu6dmznfDkWO4IEwIPYBr4M5dd3AoznKpjlWw76uYQT6Q9iqBK
	ApYm7MSNswS+5hNKh/KZoby6oIv1LtQ1g7ioIUNK6HtaCPcYR2HrsBuqIRnit09xmLdD1lG+xUb
	4gkGR+dikLF3mhIN7grG83b2fdnAop4SG+tvWWAc2gUENmkrvvpPR3LhS1cWZdFEA==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr38222127a91.6.1789022332072;
        Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10464300eec.20.2026.09.09.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:51 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs static inline
In-Reply-To: <20260902164123.2546762-8-seanjc@google.com>
Date: Thu, 10 Sep 2026 12:06:11 +0530
Message-ID: <ecf11ulg.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_073855_115725_0093D367 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Move the single-page allocator APIs to kvm_util.h as inline functions, as
> the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
> to remain that way for the foreseeable future.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
