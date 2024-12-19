Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF7E7718B
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXFO8FRit4efu3DQ3W/Wvz6TEHT3bm/sBnX3+g+s9JE=; b=zQete05qeyByvp
	UlPD5dRNey3zV9ggRdjPMKE28I6BzAzmpFz7VUCBZk2vpdbDHDfYyg2TZzI9vLjBba4FqxTvCq0YE
	E2DbFAY62GqrExiqOoW4bVOLCnCSGpCbXYejuyhv2esKSIghyXmqjkmul7rRLnotFFOijJXAauIAx
	QS5/QjPL0tu8WjTM9ZQk6MP3J2BM8j0wKLVUwcuwuf7mkX7ZvFsqLdDWVERPUD0e3lvd+EozBRShv
	tJUCdhaZuQ3MECvi9EScuEAy0c6nbiPYwLXbalTa3eP57BDMfAiGIxT3r5nPBLYydXDv+wBU+JZKZ
	WkwLjHWT4AGFcZW3CjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBPJ-00000001BMV-0Hfh;
	Thu, 19 Dec 2024 07:57:17 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBAH-000000017ul-2jSY
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:41:47 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a7e108b491so3714305ab.3
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Dec 2024 23:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734594104; x=1735198904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK6PFnM/cYjzOszuWhFFBsrj9dfFgVZgNhYUrThAqWc=;
        b=mWrX/3viR0PXBmkwOKyNW89qDfU76GvzpfI1Qjqp3q+rXhn1Wg8spZdINb+5ONeuZF
         2ZObGsSTEH3YYd/I2C9rUpWBjQPAMpyUsp7m4BHZBEvVa8jpjfRKusM84ma+I/EIzKlK
         QBFw+4tsGmHGUhEHQdBwXkhlNvyaUxU0tBgDjF+ULEZyTrf+4CnFFPMNGXHMhNU4ciuF
         wqDCepK1zudw/VH4yWQ/azlXHTyPsRaMtgSx2IImaz5p0y85LKvotd6mjsPsHtBvZwL5
         72gyfRXLDH7OkyS1LY6xVJ8yWIBI6gURK5IRG+sFV+K9LnvqlzTtDSlTMvJOKcMlU/9i
         sy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594104; x=1735198904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK6PFnM/cYjzOszuWhFFBsrj9dfFgVZgNhYUrThAqWc=;
        b=NTrMkKtoeh0JGR62WuWygW9h0QSRfbAmB7P9VfFN8QACtTVMpAU7C+w4MfPLV3jWGB
         rc55OGEPeN5mCRPYAAuSbd1DQUaZlHAQiOMFnMXpowS5POPVQAu51Mrq4ts1cn4TGCRh
         LWOmaMcyeXgIbTCMw4FP/NzLuGxb/nqoc81WFxNN4ACQS5Kf8SMUg8qJ+5goY1CH6ZUd
         WBEqeFClhqgRCm7o5jS5B8x98bixCEAy2FeDZq8meBKpXYTOl1ayQgkd6bkdKdNxuWAo
         NgKvz3JvlFeC2FrkU/ZvgUH4bC7eVYcW/pFWuEVBqgx7+XbeUQeAOYRt/EFJOOQLPzW1
         UplQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKyILXYgPUr610BCESFIyoc7tbU8u1FZmgMofI16SKkFruqvyo6JoITMQ58oCODx/ac1Bgp6iGNiA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuRM7FuxknBnpTt7JGBsAUK0ZfJfjuTQ7coKU+swSwU4tOj/ti
	OM8owxx7mXolBwSWhNkdwDaJ3rDajY/w7VW/yE+I9A5vKPdgf5oH6FLR5fFQL8v2C+gvBWQlYsT
	K0XhwA7XiSOQtLNAJ6uDXkRsqgxcX6Qg+KBGI1Q==
X-Gm-Gg: ASbGncuQmOIUeLqv4DcG/TcQuJ3hHi1DRj4bxdpc611niUdjZZrCelJPxt0LQT84gHM
	0Ds32OjyZGuVjW1oZNWQBJosXqkL+c+4b+LHcjURn
X-Google-Smtp-Source: AGHT+IGbPuySSmr1CwdOHQeWubrx1MyyRpnBfYc/XwwbMxEmLghw7Vo34EZotbYZAeerVNV2zRCMld34Fd/Fk/tzQY0=
X-Received: by 2002:a05:6e02:158b:b0:3a7:e286:a565 with SMTP id
 e9e14a558f8ab-3c0148947f4mr29393365ab.23.1734594104509; Wed, 18 Dec 2024
 23:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20240619153913.867263-1-cleger@rivosinc.com> <20240619153913.867263-5-cleger@rivosinc.com>
In-Reply-To: <20240619153913.867263-5-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 13:11:32 +0530
X-Gm-Features: AbW1kvbl_nOMADXonpsf4A_tmW9qHfMUPG4EJdNLYs-eLb1hX0IfloBaKeSVqO4
Message-ID: <CAAhSdy09SnHMoX0nanLOv_7TBt3T_xX_e6a5UX_NeZdLN7touQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_234145_693291_28AD0856 
X-CRM114-Status: GOOD (  13.65  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOToxMeKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtWTSBJU0EgZXh0ZW5zaW9uIE9O
RV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IEtWTSB1c2VyIHNwYWNlCj4gdG8gZGV0ZWN0IGFuZCBl
bmFibGUgWmFhbW8vWmFscnNjIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiArKwo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBpbmRleCBh
NjIxNTYzNGRmN2MuLmYxMGM2ZTEzM2Q0ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmgKPiBAQCAtMTc0LDYgKzE3NCw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+ICAg
ICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkNELAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRf
WkNGLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1AsCj4gKyAgICAgICBLVk1fUklT
Q1ZfSVNBX0VYVF9aQUFNTywKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBTFJTQywKPiAg
ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+
IGluZGV4IGZhNWVlNTQ0YmM2OS4uMDk3MmE5OTdiZWNhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5j
Cj4gQEAgLTQxLDcgKzQxLDkgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9l
eHRfYXJyW10gPSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4gICAgICAg
ICBLVk1fSVNBX0VYVF9BUlIoU1ZOQVBPVCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZQ
Qk1UKSwKPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUFNTyksCj4gICAgICAgICBLVk1fSVNB
X0VYVF9BUlIoWkFDQVMpLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBTFJTQyksCj4gICAg
ICAgICBLVk1fSVNBX0VYVF9BUlIoWkJBKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQkIp
LAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCQyksCj4gQEAgLTEzMSw3ICsxMzMsOSBAQCBz
dGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxv
bmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU1RDOgo+ICAgICAgICAg
Y2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1Zf
SVNBX0VYVF9TVk5BUE9UOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQUFNTzoK
PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVM6Cj4gKyAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pBTFJTQzoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRf
WkJBOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkI6Cj4gICAgICAgICBjYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1pCQzoKPiAtLQo+IDIuNDUuMgo+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
