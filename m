Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC17C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRBZWXEHaCQM/VUk4Drj59W24SAxN/aPosRzJxuO+Yg=; b=AnMUpAF251HjXu
	+sN8avUtUv+0ntdo85kCcE1GcoRk/t9Q5ZRGfAvvGb7uMrAI1x0Sdm887uEKRCp/nlVBv7IaQdg/n
	RVa136XXbZwOmfm6HvFar1dweLILeJseX7RkZiBK4ELGMcqtbuN2Zxc5wkshpTSr+2SRDLPz3v28v
	SGumTWoM4+zSe/Xacu+f8qKOkC9TKNH1U/zdasfG33zd7GvVSgRxj6jIIlbBH7fSSWesjgplTD97Z
	eqrCpZGayDZvI+CVAd9ZoPv3dg4JZqq41cKfn/4pPMwuNW48Mj7eyWrV0LOPbo3Y+xTAbviMXruUy
	6twhCRVl1lqMGCDnMg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujavS-0000000EqKB-2rGh;
	Wed, 06 Aug 2025 09:59:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujavQ-0000000EqIL-2nDa
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 09:59:13 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-af51596da56so3989349a12.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754474351; x=1755079151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVGDM3I4SAq4IdauxFBCdAq636kZPPhTHlfXhatdxwg=;
        b=i+34DQNZCmsx9C0LA8zjNNT3wq80ddG/ATPUTNgafpIE80/LqQEhW9zI9uNqnRvFuR
         tw438YSbEA7G7U/ih9cyATlck4WvKODA3RQSCw+/QbW/hQmEnpFXKbDsf/m4srLUWDDf
         1anUSkN2wvx4wNqOowbqdDv9e2uZ2ajQeHa9TppELBaJ5peotnwW2f4r0ikB7EKpYUyn
         R7xiXE1bCnjQREG7IsC523cMSmvDrVHWf84S3pXgbaMVXgJa3Ff77YTwPH/ydEtv7PjU
         aFXYuco7Ca/Bfu/TLL9+MwI8K38SuEb87WnVvkC2+lRKLzhY7QmrHicsQfvoxdb4wKh0
         CDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474351; x=1755079151;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVGDM3I4SAq4IdauxFBCdAq636kZPPhTHlfXhatdxwg=;
        b=kdvdY0T9X/LpmVRQeJJ3EoSczMu/B0wASKJVla4CiAS1ceMH+VNXSg8EFzrNPsunsb
         zKGB1UftJce+OsxtP2DSrYxbahTZ/MOOupcGTUS/9ahUuGZjy/mgJ1rxkW+05ejdTIcT
         4uW/oiDjOlDNn360QrTU8UDZOtvOsAYuJ5obhBP3noTCEBq+Dj+uodNYovMRHAa5kE4l
         wxEmiJeJj2bVk7gk1To63WzJ0vTCGZ5nkitOipm0q8EVAq6+TvzTBVq3+oSl+mrYUjdo
         RxB/KioGEu4AaPFPTJVOcVLjx5fj3Y0659pYGgEEeIsNO+OBjE3bBo+Ba4SxtErcpo2c
         B6GA==
X-Forwarded-Encrypted: i=1; AJvYcCXHmucRxMy+3bl73l2lNMFlIZ6G+SS2fHlxZOwdx+gV0o6l0TpFEA53/L5CZuP+EUMlBvt77vIHMEQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyweIvuzumqFshSW+wvUUlfkpyN7OcGdY1bkefpYgTxAmQfnZzL
	Uth+1wDIwSfsZj4yEjtp62wG6jvPrXmj4lSadZMmh9yI0/rNt/sv9FuqV9hQ/lWnYi0=
X-Gm-Gg: ASbGncv0suGDD1cHI8yhQqOCOfWtuShi8/SSKQLOGrex+lal7nEDLZKJ0r2NRUJ7zCI
	bLQ309lMSxVQWWF8O9bDLE5FTqOvt+OM3LhwHZPc2gDp6WK6Fa4zvVft02nI1G3u8HFMYbLOVhq
	qo1h+EbnpzFHHCK3PGnJPmwVroP9VrHJP872mR2KOpsj52mze/PQPvdBE7QZyfzimb7npqjBKc5
	pGIdDuv/jayv22KlLNPocsV9yF9Dd1205UDcsgrC6qey7nUhHI7k+j6CicHkl3FJqssPt1P9QKz
	juZmj0CM84zrFDj2IRTLalMqoUnx6jTWQnaiyLq/R9Zl922+RB2xQHPV+Ub6UnkAoyy4zLWKpka
	0yDyLoNTcU2Ot1Em23ncbz+rkdvCOC+9zg0I=
X-Google-Smtp-Source: AGHT+IFDQkiy8dEal9JGcheFb4DCeMC/D2uxTEcourcA4xojZOo5yHWKjW3OBM8sYPB5X5rv1iZYAg==
X-Received: by 2002:a17:903:2302:b0:240:25f3:211b with SMTP id d9443c01a7336-242a0beacd1mr26147005ad.51.1754474351119;
        Wed, 06 Aug 2025 02:59:11 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.244.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c03sm154551605ad.97.2025.08.06.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:59:10 -0700 (PDT)
Message-ID: <953d2f4c-d82f-4e8f-a905-b7dfbf690ef7@ventanamicro.com>
Date: Wed, 6 Aug 2025 06:59:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 stable@vger.kernel.org
References: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_025912_711560_6128A260 
X-CRM114-Status: GOOD (  11.41  )
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

CgpPbiA4LzUvMjUgNzo0NCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IFRoZSB1c2Vyc3Bh
Y2UgbG9hZCBjYW4gcHV0IHVwIHRvIDIwNDggYml0cyBpbnRvIGFuIHhsZW4gYml0IHN0YWNrCj4g
YnVmZmVyLiAgV2Ugd2FudCBvbmx5IHhsZW4gYml0cywgc28gY2hlY2sgdGhlIHNpemUgYmVmb3Jl
aGFuZC4KPiAKPiBGaXhlczogMmZhMjkwMzcyZGZlICgiUklTQy1WOiBLVk06IGFkZCAndmxlbmIn
IFZlY3RvciBDU1IiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2Zm
LWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KClJl
dmlld2VkLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFAdmVudGFuYW1pY3Jv
LmNvbT4KCj4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIHwgMiArKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+IGluZGV4IGE1
Zjg4Y2I3MTdmMy4uMDVmM2NjMmQ4ZTMxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTE4
Miw2ICsxODIsOCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3JlZ192ZWN0b3Ioc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgCQlzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4ID0gJnZjcHUt
PmFyY2guZ3Vlc3RfY29udGV4dDsKPiAgIAkJdW5zaWduZWQgbG9uZyByZWdfdmFsOwo+ICAgCj4g
KwkJaWYgKHJlZ19zaXplICE9IHNpemVvZihyZWdfdmFsKSkKPiArCQkJcmV0dXJuIC1FSU5WQUw7
Cj4gICAJCWlmIChjb3B5X2Zyb21fdXNlcigmcmVnX3ZhbCwgdWFkZHIsIHJlZ19zaXplKSkKPiAg
IAkJCXJldHVybiAtRUZBVUxUOwo+ICAgCQlpZiAocmVnX3ZhbCAhPSBjbnR4LT52ZWN0b3Iudmxl
bmIpCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
