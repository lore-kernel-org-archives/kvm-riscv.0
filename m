Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F7E77188
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPmmcsA75Gb5T0dcTt0KsVfIAUQKgXHLOuA5SsljRVg=; b=l/1BWm082LQKDY
	gl80w0rIFjgsJeUEcUM/yM4BUnjui6Z/Vaun8mPZSx3SYX5zRAuLyVw3HSq1fxmpH183ULw4wtM9I
	5vY8SR5wJHHLW66UKWjHbxI4Z6S0T5LV7uqQyj3PKJ4GhMKRLaplMR6zt2bPoWQuOyBYhQpBsf6CP
	K4M/AsWtpBOKpgqRlpgMnnHA5RXTY6/TGc2tX8ngQQg7gd68c9m4xRxv4TR9+OKs0TbpKOkGwZOwP
	mYYTvA1ZAs89UM/vY36rttzOSJY5fmamrrzsex6oGn06vag0lXyNqdtI+NqAwbOQFu/pQNoFvfydZ
	KEflBPXXOsqGkQwoCaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQg7-0000000HX4Y-0fX0;
	Sat, 11 Jan 2025 01:52:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOdn-0000000HIom-2uOD
	for kvm-riscv@bombadil.infradead.org;
	Fri, 10 Jan 2025 23:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y41MK1nXhHF98Zje9jhZUfIRHZr079NmtrcL30tPVwU=; b=mXu4FzIsd/7iuZmjYDGrl0R2aZ
	OEmD6XU/4GCyrrNKlWi1AyAqKHJtg4ePdB7EkXPPeU6gzelzdyOm1ba9wVsiccWbcZX2CfxtByUVO
	QC+ZuOgAlPp93L9AjkygWGM+N+kKIPKFHndVfEHgEZmCDXlvgS10liYJpkjzyzmPO16XdYl1uouZ0
	QiHtNKlvnD5B2C/No7HHu4qepgSlUAE3fWej9/IjfoPLRmHHNDlMILP9HntW/V0l2miyDo0g1g3QW
	z1BorDrlGxaiijqgq/ZEFyxJ38dIRsQEekQeyU85STYlpE/oKgwDoob3fFbstSuT3DorjTqTvCbNe
	aokvpdHg==;
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOdk-00000009w5m-1up9
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 23:42:10 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-844e12f702dso81735939f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 15:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736552523; x=1737157323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y41MK1nXhHF98Zje9jhZUfIRHZr079NmtrcL30tPVwU=;
        b=OC5q92pqIpYWKl4lI4oq/iVnSBaK5VI7OSL2H7t5HgTPDiYkPWHcBujNBX6qSMvXHY
         iYXFzhmlwAnb+45PiGBe3tbNgrqth5uUNX/R0nYQTct0sZf/dokoe3kzIvx16sFgWVjI
         hvFg67w3MgbOhhqHwHbsfXQzzsgLX5e29aCK8F+ZgkECEtH0HE3IQUU06ylahR0DVn4o
         +CDZOb9CnViDMKrdck0vmKjCmMnWhUpyULX5RSxA1dA/9/OYhTVwelj4DW3pxftr7Ole
         0of2msMpA6Mac76Q+zYBUkJgNDJ9PRT/CCS0EE+5tKh64hWhgvq6UydZuoKGjc5w3pDV
         juUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736552523; x=1737157323;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y41MK1nXhHF98Zje9jhZUfIRHZr079NmtrcL30tPVwU=;
        b=pyoxmQKosILZOtNlnkDdmS0brSD68nfD7aq6uGulC7Hy500HUSBek/KCAanSnkkhMr
         QOzUsazQnQN8uCS7Ppg3OOWanjVU+EH9HxRaWWdHrXBSJ5IG33mc7Wm0SecE+Wp3cr9/
         jdIF3mX8r+Md/eKdWoM5/3m+ZYNi6HnYCwYYlqAxPgbyEQaodVK7RKBaSR+KfuX48KiV
         eCaxZmHnTyVnY7Ixn/rQqimxGrujhrj1ObCFvEGmTrz01/NSHRmoP6A2HRbMQJsljSi/
         FIlxaUc/f39NHbDmtt7esYNK9BCyQw/GcLZrObS4bobEmlydPahTE1fxJYUfoYx19D6W
         oVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+/1xG7J8nI4auXexN4oyrsrIt1GSvddQ7TO6K5vcXKHbTCfiZgooYlAhUBZqLYUgvMXTOQA7uIBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxceUiktUBdIIL52vU31pHjmAsJUBLLwDH9tu98rHjl3rnHujqM
	qcJ6JKeSao6BiTGAz6kTxztlKZCV0/Rltyy3ldb7DW0P79nDcG7Gt5uZtGYERtE=
X-Gm-Gg: ASbGnctLA7WHc4/XL8qDz0kXa4rByIQpmAid5IKCZbRhAWhI/X6NJBd93QuQAUm5pqf
	Ts1hZC/VjkerigAfGHs41QhHZ3/SfUOr7hh+c4iFd98gKtTkcYtilI89ousX+D5XE3cmIeRsNUz
	G6cGmrBt33ZsdCG/mkcGsr/RmMRwWcVC4VswP4csGdbpnDmyFBYC1+tI+iQh4mDkZ2asTxK9h61
	lhOq4igZv6z8he8VSKOc55+pf3ho0xc0TbP3B64irphH0pGYNvkvUeEZRAe2SUmTCoLh/duhCdV
	s14d
X-Google-Smtp-Source: AGHT+IEvcdQ6WJ2GPTcAtzPp+zU0y4cUD8oHRoixv++8yvMOyxwbuZNKeY1IICJwtAM7OPu+Ww0QiQ==
X-Received: by 2002:a05:6602:3787:b0:843:ea9a:acc4 with SMTP id ca18e2360f4ac-84ce01254c3mr1252136939f.8.1736552522737;
        Fri, 10 Jan 2025 15:42:02 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4faee16bsm113381339f.4.2025.01.10.15.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:42:02 -0800 (PST)
Message-ID: <a6196a16-808e-4a69-bcec-a83d868b726f@sifive.com>
Date: Fri, 10 Jan 2025 17:42:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] RISC-V: KVM: add SBI extension init()/deinit()
 functions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-4-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
In-Reply-To: <20250106154847.1100344-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_234208_674156_AB7EC054 
X-CRM114-Status: GOOD (  21.87  )
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

SGkgQ2zDqW1lbnQsCgpPbiAyMDI1LTAxLTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90
ZToKPiBUaGUgRldGVCBTQkkgZXh0ZW5zaW9uIHdpbGwgbmVlZCB0byBkeW5hbWljYWxseSBhbGxv
Y2F0ZSBtZW1vcnkgYW5kIGRvCj4gaW5pdCB0aW1lIHNwZWNpZmljIGluaXRpYWxpemF0aW9uLiBB
ZGQgYW4gaW5pdC9kZWluaXQgY2FsbGJhY2tzIHRoYXQKPiBhbGxvd3MgdG8gZG8gc28uCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDkgKysrKysrKysK
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysr
KysrKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2Jp
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gaW5kZXggYjk2NzA1
MjU4Y2Y5Li44YzQ2NWNlOTBlNzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiBAQCAtNDksNiArNDksMTQgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24g
ewo+ICAKPiAgCS8qIEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBmdW5jdGlvbiAqLwo+ICAJdW5z
aWduZWQgbG9uZyAoKnByb2JlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsKPiArCS8qCj4g
KwkgKiBJbml0L2RlaW5pdCBmdW5jdGlvbiBjYWxsZWQgb25jZSBkdXJpbmcgVkNQVSBpbml0L2Rl
c3Ryb3kuIFRoZXNlCj4gKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNCSSBleHRlbnNpb25zIG5l
ZWQgdG8gYWxsb2NhdGUgb3IgZG8gc3BlY2lmaWMKPiArCSAqIGluaXQgdGltZSBvbmx5IGNvbmZp
Z3VyYXRpb24uCj4gKwkgKi8KPiArCWludCAoKmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
Cj4gKwl2b2lkICgqZGVpbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICB9Owo+ICAKPiAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBrdm1fcnVuICpydW4pOwo+IEBAIC02OSw2ICs3Nyw3IEBAIGNvbnN0IHN0cnVjdCBrdm1f
dmNwdV9zYmlfZXh0ZW5zaW9uICprdm1fdmNwdV9zYmlfZmluZF9leHQoCj4gIGJvb2wgcmlzY3Zf
dmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7Cj4g
IGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3J1biAqcnVuKTsKPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KTsKPiAgCj4gIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9z
dGEoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCj4gIAkJCQkg
ICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggZTA0OGRjYzZlNjVlLi4zNDIw
YTRhNjJjOTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTE4MCw2ICsxODAsOCBAQCB2b2lkIGt2bV9hcmNoX3Zj
cHVfcG9zdGNyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIAo+ICB2b2lkIGt2bV9hcmNo
X3ZjcHVfZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiArCWt2bV9yaXNjdl92
Y3B1X3NiaV9kZWluaXQodmNwdSk7Cj4gKwo+ICAJLyogQ2xlYW51cCBWQ1BVIEFJQSBjb250ZXh0
ICovCj4gIAlrdm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwo+ICAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMK
PiBpbmRleCA2ZTcwNGVkODZhODMuLmQyZGJiMDc2MjA3MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBA
IC00ODYsNyArNDg2LDcgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4gIAlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0g
JnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gIAljb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9l
eHRlbnNpb25fZW50cnkgKmVudHJ5Owo+ICAJY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gKmV4dDsKPiAtCWludCBpZHgsIGk7Cj4gKwlpbnQgaWR4LCBpLCByZXQ7Cj4gIAo+ICAJ
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2JpX2V4dCk7IGkrKykgewo+ICAJCWVudHJ5ID0g
JnNiaV9leHRbaV07Cj4gQEAgLTUwMSw4ICs1MDEsMzcgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAg
Cj4gKwkJaWYgKGV4dC0+aW5pdCkgewo+ICsJCQlyZXQgPSBleHQtPmluaXQodmNwdSk7Cj4gKwkJ
CWlmIChyZXQpCj4gKwkJCQlzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0KPiArCQkJCQlLVk1f
UklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5BVkFJTEFCTEU7Cj4gKwkJfQo+ICsKPiAgCQlzY29udGV4
dC0+ZXh0X3N0YXR1c1tpZHhdID0gZXh0LT5kZWZhdWx0X2Rpc2FibGVkID8KPiAgCQkJCQlLVk1f
UklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQgOgo+ICAJCQkJCUtWTV9SSVNDVl9TQklfRVhU
X1NUQVRVU19FTkFCTEVEOwoKVGhpcyB3aWxsIG92ZXJ3cml0ZSB0aGUgS1ZNX1JJU0NWX1NCSV9F
WFRfU1RBVFVTX1VOQVZBSUxBQkxFIHNldCBhYm92ZS4KCj4gIAl9Cj4gIH0KPiArCj4gK3ZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
CXN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlf
Y29udGV4dDsKPiArCWNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAq
ZW50cnk7Cj4gKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ICsJ
aW50IGlkeCwgaTsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsg
aSsrKSB7Cj4gKwkJZW50cnkgPSAmc2JpX2V4dFtpXTsKPiArCQlleHQgPSBlbnRyeS0+ZXh0X3B0
cjsKPiArCQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKPiArCj4gKwkJaWYgKGlkeCA8IDAgfHwgaWR4
ID49IEFSUkFZX1NJWkUoc2NvbnRleHQtPmV4dF9zdGF0dXMpKQo+ICsJCQljb250aW51ZTsKPiAr
Cj4gKwkJaWYgKHNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gIT0gS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX0VOQUJMRUQgfHwgIWV4dC0+ZGVpbml0KQoKR2l2ZW4gdGhhdCBhbiBleHRlbnNpb24g
Y2FuIGJlIGVuYWJsZWQvZGlzYWJsZWQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24sIHRoaXMKc2hvdWxk
IG9ubHkgc2tpcCBkZWluaXQgaWYgdGhlIHN0YXR1cyBpcyBVTkFWQUlMQUJMRS4KClJlZ2FyZHMs
ClNhbXVlbAoKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCWV4dC0+ZGVpbml0KHZjcHUpOwo+ICsJ
fQo+ICt9CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
