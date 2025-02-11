Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E29C021A1
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNZIyip8WxAQx1oj7nhenjzcQpF+8Qu6Eve4AqsPjfc=; b=f6CcELCcrLYqHakylUFZfAZA1v
	UXP7XC90drtWlN07pE10OpWx8DwVtt8wifutT7Ad4ovGXWjM5Gsz+gr4e8AvUGnPirLy71+3KEjMK
	OxbwPgS0Cmn+5p4XUTVBv2sBNHkspjf+ISZZN29LMcrmSxC/E2k3hOJpW+rsXKF24c/3dkfbn4P+s
	b1QhHEbbLq0qDSJdvATo/mbBW6IGExen3ikCojz40cSB0SDTjqewzACgfKfc0FjCZ0u5gDD53K3l5
	tP/ahlG/HNvS3VyO1bVHBHS7ftZLeN8f8sDuaCeJJ+f5Tj2pXyHbe0QyTVH76G2XM08uH3hjZ4KaB
	zFKx7kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht4D-00000004UaE-0Zgk;
	Tue, 11 Feb 2025 16:24:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsok-00000004Qb6-1Epc
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 16:09:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-219f8263ae0so103143355ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 11 Feb 2025 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739290137; x=1739894937; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fM6tMWdfzkcGZeMu8sbljrtpDaDJ3qlk57x3dLx9yP0=;
        b=qFObyTMrjb5UH893h+bE7YUQMt5eE7ynv6iwQiXJaWGzKBVfg1H/epXaQzZw/rKrmW
         nFcLXHWjbo82UPnwxK2shMwJUInAL9aWs/EHUMa1k8xuBu+/H52jU6FuOppv9dr71yQh
         UNwKS1NUQD0yP2F4rC82EjXwj0Q5WH3S+xCYoW5lZVDhrnBhuL+YkR/QM5gV4PGTtNHB
         AYAkdlhlhkORJ3Mpcd4gXJnZGpoqWhelLFJjnQoSy5NoOO61QeVRSFcOysD/m66RkXUS
         p04inYlW91ey/JC82pKNC5jyl1+KJZjr+/nEz554UMHP515Eueu3J/n9j31WXErMB3nO
         Wl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290137; x=1739894937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM6tMWdfzkcGZeMu8sbljrtpDaDJ3qlk57x3dLx9yP0=;
        b=h23WQB7bP92aw3J335Ggp78yym1IUi8OclMk/Xmhb9gl3hosjkhnT88yUf9X8uY1mS
         dNFwe4LhzRZcQUhmyX29Rg2NEx83KhaVm+esq/LJtQoWJn7nfmGBhOb4l+2XSdmHEdcG
         5gcZWCgpR7LjZD62FGGZey/0oJw49RW19ohqEhBmaDRLrMJ8fsyA8s5/9XUbV8zFKHc8
         gA3aQXgDDDwX8Z9iJwQCPBilzNTK8qB6cNQAqCcWkZVm73RItQhZU6qrv/sCc95lPk3J
         JoYUmVUqGd/mx9SzOfw2WCJTtJOw7RpIy7jKEejtVbYVsKyD0W4SPsThep/FnX8r+B2A
         iyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVuLHSkUSGW69aFDkf01Idc7KAbYJ2v8Zdbazl6qB0Fs0GYKi+GbNzUhLmOwskueMJsckcPTz4cfLY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+GaQp1pb2b8r7xxZ+5FE6upOBOU9QdFzzZnBB0cWWMmM+3SCC
	VLUh/VYismtLslSE2u4w4uMA7+N/v3bVJEE98a0uJfp0VAX6XaNSxhSVzTX37pM=
X-Gm-Gg: ASbGnctFnsq/H2k3+imXqYP/yGN0UoVD4R844C90j8aGWtEZP8rJfOMB++tNyYUmKss
	tz2EG7CIHkO8kfElX68nfOmBDi9AwEfeS2G8KFkFgn1C/3wL5v3Yr/FRppcZM6mRln4PODkmdd3
	FF2fmb3Pt8z8UxOX0Yxvx6cbbh9M5vXvqjPKO7NajFRKZOhiIXWBhSvRjjabCqJdSHg0unZU+Ae
	ECqTnjukNivA+D0XDzpP+ZpayqE9G5rsASYwHgqRtRbcr4AxzDI+RBDdWiupu77NrJoyzXkr/S5
	sBJXXXIQajtGjnYMKs69Cdd8AQ==
X-Google-Smtp-Source: AGHT+IFZ7zG8kNq32XbGzHizA+/obYPBTcZQNtVCcsm+yZBTBiOP0hgDR8QeXXdRboljfbChEW5/qA==
X-Received: by 2002:a05:6a20:6f9c:b0:1e1:c054:4c58 with SMTP id adf61e73a8af0-1ee03a22be8mr33720540637.2.1739290137163;
        Tue, 11 Feb 2025 08:08:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730887b0fa8sm4433085b3a.8.2025.02.11.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:56 -0800 (PST)
Date: Tue, 11 Feb 2025 08:08:54 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <Z6t2FsP91rUNv64D@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
 <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
 <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080858_592161_96DBE06A 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 11:31:28AM +0100, Cl=E9ment L=E9ger wrote:
>
>
>On 11/02/2025 06:43, Deepak Gupta wrote:
>>> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long
>>> feature,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long *value)
>>> +{
>>> +=A0=A0=A0 int ret;
>>> +=A0=A0=A0 struct kvm_sbi_fwft_config *conf;
>>> +
>>> +=A0=A0=A0 ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
>>> +=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0 return ret;
>>> +
>>> +=A0=A0=A0 return conf->feature->get(vcpu, conf, value);
>>> +}
>>> +
>>> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct
>>> kvm_run *run,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct kvm_v=
cpu_sbi_return *retdata)
>>> +{
>>> +=A0=A0=A0 int ret =3D 0;
>>> +=A0=A0=A0 struct kvm_cpu_context *cp =3D &vcpu->arch.guest_context;
>>> +=A0=A0=A0 unsigned long funcid =3D cp->a6;
>>> +
>>> +=A0=A0=A0 switch (funcid) {
>>> +=A0=A0=A0 case SBI_EXT_FWFT_SET:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, c=
p->a2);
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 case SBI_EXT_FWFT_GET:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D kvm_sbi_fwft_get(vcpu, cp->a0, &retdata-=
>out_val);
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 default:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D SBI_ERR_NOT_SUPPORTED;
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0 retdata->err_val =3D ret;
>>> +
>>> +=A0=A0=A0 return 0;
>>> +}
>>> +
>>> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
>>> +{
>>> +=A0=A0=A0 struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>>> +=A0=A0=A0 const struct kvm_sbi_fwft_feature *feature;
>>> +=A0=A0=A0 struct kvm_sbi_fwft_config *conf;
>>> +=A0=A0=A0 int i;
>>> +
>>> +=A0=A0=A0 fwft->configs =3D kcalloc(ARRAY_SIZE(features), sizeof(struct
>>> kvm_sbi_fwft_config),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_KERNEL);
>> nit:
>>
>> I understand that in next patch you grow the static array`features`. But
>> in this patch
>> `ARRAY_SIZE(features)` evaluates to 0, thus kcalloc will be returning a
>> pointer
>> to some slab block (IIRC, kcalloc will not return NULL if size
>> eventually evals to 0)
>>
>> This probably won't result in some bad stuff. But still there is a
>> pointer in
>> fwft->configs which is pointing to some random stuff if `features` turns
>> out to be
>> empty.
>>
>> Let me know if I got that right or missing something.
>
>So I actually searched into the kmalloc code to see what hapopens with a
>zero size allocation and it actually return ZERO_SIZE_PTR:
>
>/*
> * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> *
> * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
> *
> * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL
>can.
> * Both make kfree a no-op.
> */
>
>Which seems like it's not really random and will fault if accessed. I
>think that's enough for that commit (which will be bisectable if needed
>then).
>

Awesome. Thanks for looking into it.

>Cl=E9ment

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
