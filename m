Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65115C021AA
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v9J9ZlXiYSOpTsSmlV3DAagbmFKxxUAixg3r62amlk=; b=eatnjLO35vK6hn
	TYNiEms41AclvbMKITwM/T/w2+6xqrcIFz3puRJYXi4H8uIq441AAhmrZWzqD2JWsNmo/JvaZv9nE
	qN+6dHi3sxKJIBUPQoaC0S1Hc0WekIhXJl+C1ojH6A4uwNXIhBVzNgxA2G1vvYl6edWY3I88bXQEs
	OlId3F7XZVrEw2SQemgjR/NcgH865/idZHd0y2fGlQW0x+BeF3zrbXhIUUT4jIziWwRaZK+O5eNq4
	VFlc0fX/HKUEYAyaBn8SjCd+g9myhhWSE6W9/6E8aNtGgrIFc5UAI/29D2PbHmu1WStAt4RCooGvJ
	VSu1+yYvUSOsQXXnFUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgRp-0000000Bt6s-0XE3;
	Wed, 19 Feb 2025 09:32:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgFI-0000000BoFv-28xc
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 09:19:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so1029195e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Feb 2025 01:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20230601.gappssmtp.com; s=20230601; t=1739956794; x=1740561594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPv0PcxZbQ5E8xo8EMEjEFC7wJud2XnWYwVKRW6hZig=;
        b=Mf6gUPB2zcmKztvbTVwF7WomH4clDnqTN0+DJvA4CQVvcwAW9l+50wknUTMXTAp5WR
         9GJ97YuFI4e364EwnD75iTUFsbg7pYjVpTXHmQWk4W90CUVSL2atvPnOyYdHFZ9LrlVw
         AQM74mobLUJ/kY0ZZdWt5wITxhNagjGEz/ejz/Tgnzay5O8x+uYT5ZtEx8sJDyKK1+78
         HRbgeNHEGmI3Ki0ZURmrxQjDerw6sz83QKfsQpReDk5gxjxHrRTKEyj35/AmjTO8rJr7
         jdDNfRTqQTDieH5iCe26Fh1BE36whYSs8/+ClE/ne+Z07bJ4FdthxD8erJls9dLaC/W1
         LlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956794; x=1740561594;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPv0PcxZbQ5E8xo8EMEjEFC7wJud2XnWYwVKRW6hZig=;
        b=Ys5c0CwHaxwiFNobsF6icT+kmFyUd/LLAUI48J8ry4oqKnS2wrDq7VmBaGcA7cKPOy
         7SpDyD1I8LGcDTP9gwcCyiBkMXAv+CG+iGyokTETxiRL+p9q97/Wjg74pNlSNoRundH+
         Hw+6qcGZIlMjUNupHScfLozYfwXZ37i/vO9B3ojVJtdzhkKX+MA+RUg4D1O7N38EuyZL
         WTcy/X0AZIQO8MF0jq80gJWXTyl+BFe3/YtnIMr6NRRYWTA2+qS385hjy47wz7v0gRUJ
         sKvbFsfUd0to0wWbOgFg9LPhDRJ5xBcJ493UlpDDBCEgEbctR2IlBAFagePk0X5tDAxA
         8heA==
X-Gm-Message-State: AOJu0YwZUacW29DWgKedjzNX8Znpd5rkLtzd6ScmM/BG0TJI0DntF7yN
	kxjo4veJ+Jw2wwW5w5GEJ4zGfwozAK/zZGogXJ4pY8pTkYG9G/ax1WgTVDrraKw=
X-Gm-Gg: ASbGncsfAqVmFKub/IQBTXdkYy794Sk9HFRbVsi5TAUxnaWce/3hu3Eg4RAO4Z4xASh
	AgfRM+VSBlEvrC/B+xkrN9OIt+LMGzUtZlX37Z4KtO6JX8WR88gnd9A3SPDk+VBTY9y8zpaa4pX
	vzOsMs8aWWAcIOSNlOGx5AX4yTnkYLiQOyk5ZUs++qKUonMA18G5G7T5m+xXHzaFs0hlYH74cnd
	stOCAdVMWPw07CAJRX2uAK+E1E5emB2jNjkoFAGbWLBSB+nwXQ8o8ICs6ir+7bthrbryhr4EdV+
	q216npdztkx9LreVo1ce0M96ZA5dZQEOCNAmmh8w2n4wSbzWtBAumlvyPsmQosZFg1akEFUhksL
	AEg==
X-Google-Smtp-Source: AGHT+IFnPVppRba6e5t6Lxx53suSOGINLaLHgnbOQLeKXrw0Rwjr4nx2JD48R7Ry2DO24jl8YYHhEg==
X-Received: by 2002:a05:600c:6a92:b0:439:96a4:d2a8 with SMTP id 5b1f17b1804b1-43999ae01f9mr22241105e9.5.1739956794467;
        Wed, 19 Feb 2025 01:19:54 -0800 (PST)
Received: from ?IPV6:2001:861:8b82:e3f0:652b:a6a1:f717:23c3? ([2001:861:8b82:e3f0:652b:a6a1:f717:23c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddba7sm17538151f8f.38.2025.02.19.01.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 01:19:54 -0800 (PST)
Message-ID: <5e839bfd-16c0-45cc-b01a-6ae69f6a22cd@virtualopensystems.com>
Date: Wed, 19 Feb 2025 10:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Samuele Paone <s.paone@virtualopensystems.com>
Subject: Re: [QUESTION] Understanding in-kernel irqchip (APLIC + IMSIC)
 behavior with multiple devices and interrupt handling
To: Anup Patel <apatel@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, Alvise Rigo <a.rigo@virtualopensystems.com>
References: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
 <CAK9=C2UUnP0xV-p6NMH8ma2-hB2K52_5Ug-OKJWcSq1xwBXCFw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAK9=C2UUnP0xV-p6NMH8ma2-hB2K52_5Ug-OKJWcSq1xwBXCFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011956_751871_54033A79 
X-CRM114-Status: GOOD (  25.07  )
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

SGVsbG8sCnRoYW5rcyBmb3IgdGhlIHJlcGx5CgpJIGFtIGFza2luZyB0aGF0IGJlY2F1c2Ugd2Ug
aGF2ZSB0aGUgc3VzcGVjdCB0aGF0IHRoZXJlIGlzCmEgc21hbGwgZXJyb3IgaW4gdGhlIHdheSBl
ZGdlIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGFyZSBlbXVsYXRlZCB3aGVuIGEKZGV2aWNlIHBlcmZv
cm0gYSB3cml0ZSBvbiB0aGUgaXJxZmQuCgpUaGUgcG9pbnQgaXMgdGhhdCBpbiBgdmlydC9rdm0v
ZXZlbnRmZC5jYCBpbiBmdW5jdGlvbiBgaXJxZmRfd2FrZXVwYDoKYGBgCiDCoMKgwqDCoMKgwqDC
oCBpZiAoa3ZtX2FyY2hfc2V0X2lycV9pbmF0b21pYygmaXJxLCBrdm0sCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBLVk1fVVNFUlNQQUNFX0lSUV9T
T1VSQ0VfSUQsIDEsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmYWxzZSkgPT0gLUVXT1VMREJMT0NLKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
Y2hlZHVsZV93b3JrKCZpcnFmZC0+aW5qZWN0KTsKYGBgClRoZSBsZXZlbCBpcyBhbHdheXMgc2V0
IHRvIDEuIEluIHRoZSBjYXNlIG9mIGFuIGVkZ2UgdHJpZ2dlcmVkIGludGVycnVwdCwKSSB3b3Vs
ZCBleHBlY3QgdGhlIGJlaGF2aW9yIG9mIGAmaXJxZmQtPmluamVjdGA6CmBgYAogwqDCoMKgIGlm
ICghaXJxZmQtPnJlc2FtcGxlcikgewogwqDCoMKgwqDCoMKgwqAga3ZtX3NldF9pcnEoa3ZtLCBL
Vk1fVVNFUlNQQUNFX0lSUV9TT1VSQ0VfSUQsIGlycWZkLT5nc2ksIDEsCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UpOwogwqDCoMKgwqDCoMKgwqAga3ZtX3NldF9pcnEoa3Zt
LCBLVk1fVVNFUlNQQUNFX0lSUV9TT1VSQ0VfSUQsIGlycWZkLT5nc2ksIDAsCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UpOwogwqDCoMKgIH0gZWxzZQogwqDCoMKgwqDCoMKg
wqAga3ZtX3NldF9pcnEoa3ZtLCBLVk1fSVJRRkRfUkVTQU1QTEVfSVJRX1NPVVJDRV9JRCwKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcnFmZC0+Z3NpLCAxLCBmYWxzZSk7Cn0KYGBg
CgpUaGUgcG9pbnQgaXMsIHRoYXQgY2FuIG5ldmVyIGhhcHBlbiBzaW5jZSBga3ZtX3NldF9pcnFf
aW5hdG9taWNgIGlzIAppbXBsZW1lbnRlZApsaWtlIHRoaXM6CmBgYAppbnQga3ZtX2FyY2hfc2V0
X2lycV9pbmF0b21pYyhzdHJ1Y3Qga3ZtX2tlcm5lbF9pcnFfcm91dGluZ19lbnRyeSAqZSwKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGt2bSAqa3ZtLCBpbnQgaXJx
X3NvdXJjZV9pZCwgaW50IGxldmVsLAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBib29sIGxpbmVfc3RhdHVzKQp7CiDCoMKgwqAgaWYgKCFsZXZlbCkKIMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRVdPVUxEQkxPQ0s7Ci4uLgp9CmBgYApSZWdhcmRzLApTYW11ZWxlCgpPbiAxLzMx
LzI1IDY6MDYgUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAx
MDozNuKAr1BNIFNhbXVlbGUgUGFvbmUKPiA8cy5wYW9uZUB2aXJ0dWFsb3BlbnN5c3RlbXMuY29t
PiB3cm90ZToKPj4gSGVsbG8gZXZlcnlvbmUsCj4+IEkgaGF2ZSBhIGZldyBxdWVzdGlvbnMgcmVn
YXJkaW5nIHRoZSBpbi1rZXJuZWwgaXJxY2hpcAo+PiBpbXBsZW1lbnRhdGlvbiwgc3BlY2lmaWNh
bGx5IGluIHRoZSBjb250ZXh0IG9mIEFQTElDIGFuZCBJTVNJQyBmb3IKPj4gUklTQy1WOgo+Pgo+
PiAxLiAqKkJlaGF2aW9yIHdpdGggTXVsdGlwbGUgRGV2aWNlcyoqOiBEb2VzIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uCj4+IHN1cHBvcnQgdGhlIGNyZWF0aW9uIG9mIGEgVk0gd2l0aCBib3Ro
IFBDSSBkZXZpY2VzICh0aGF0IHVzZSBNU0kpIGFuZAo+PiBNTUlPIGRldmljZXMgKHRoYXQgdXNl
IHdpcmVkIGludGVycnVwdHMpPwo+IFllcywgaXRzIHN1cHBvcnRlZC4KPgo+IE1TSXMgZnJvbSBi
b3RoIFBDSWUgYW5kIFBsYXRmb3JtIGRldmljZXMgYXJlIHByb2Nlc3NlZCBieSBJTVNJQy4KPiBX
aXJlZCBpbnRlcnJ1cHRzIGFyZSBoYW5kbGVkIHRocm91Z2ggQVBMSUMgTVNJLW1vZGUgd2hlcmUg
dGhlCj4gQVBMSUMgY29udmVydHMgaW50ZXJydXB0IHN0YXRlIGNoYW5nZSBpbnRvIE1TSSB3cml0
ZXMuCj4KPj4gSWYgc3VjaCBhIHNjZW5hcmlvIGlzIG5vdCBzdXBwb3J0ZWQsIGhvdyBjYW4gSSBj
b25maWd1cmUgYW4gTU1JTwo+PiBkZXZpY2UgdG8gdXNlIE1TSSBpbnRlcnJ1cHRzPyBXb3VsZCBp
dCBhbGwgYm9pbCBkb3duIHRvIHNvbWUgZGV2aWNlCj4+IHRyZWUgY29uZmlndXJhdGlvbgo+PiAo
aS5lLiwgdGhlIE1NSU8gZGV2aWNlIHRyZWUgbm9kZSAiaW50ZXJydXB0cyIgcHJvcGVydHkgcmVm
ZXJlbmNpbmcgdGhlCj4+IElNU0lDIHJhdGhlciB0aGFuIHRoZSBBUExJQyBkaXJlY3RseSk/Cj4g
UGxhdGZvcm0gKG9yIE1NSU8pIGRldmljZXMgd2l0aCBNU0kgc3VwcG9ydCBkb24ndCBuZWVkIHRo
ZSAiaW50ZXJydXB0cyIKPiBEVCBwcm9wZXJ0eSwgaW5zdGVhZCB0aGUgIm1zaS1wYXJlbnQiIERU
IHByb3BlcnR5IGlzIHVzZWQgdG8gcG9pbnQgdG8KPiB0aGUgSU1TSUNzLgo+Cj4+IDIuIEkgZmlu
ZCB1bmNsZWFyIGhvdyB0aGUgdmFyaWFibGUgYGxldmVsYCBpcyB1c2VkIGluc2lkZSBmdW5jdGlv
bgo+PiBga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbmplY3RgIGluIGBhcmNoL3Jpc2N2L2t2bS9haWFf
YXBsaWMuY2AKPj4KPj4gYGBgCj4+IHN3aXRjaCAoaXJxZC0+c291cmNlY2ZnICYgQVBMSUNfU09V
UkNFQ0ZHX1NNX01BU0spIHsKPj4gY2FzZSBBUExJQ19TT1VSQ0VDRkdfU01fRURHRV9SSVNFOgo+
PiBpZiAobGV2ZWwgJiYgIShpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9JTlBVVCkgJiYK
Pj4gICAgICAhKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX1BFTkRJTkcpKQo+PiBpcnFk
LT5zdGF0ZSB8PSBBUExJQ19JUlFfU1RBVEVfUEVORElORzsKPj4gICAgICAgICAgICAgICAgICBs
ZXZlbCA9IDA7Cj4+IGJyZWFrOwo+PiBjYXNlIEFQTElDX1NPVVJDRUNGR19TTV9FREdFX0ZBTEw6
Cj4+IGlmICghbGV2ZWwgJiYgKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX0lOUFVUKSAm
Jgo+PiAgICAgICEoaXJxZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVfUEVORElORykpCj4+IGly
cWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9QRU5ESU5HOwo+PiBicmVhazsKPj4gY2FzZSBB
UExJQ19TT1VSQ0VDRkdfU01fTEVWRUxfSElHSDoKPj4gaWYgKGxldmVsICYmICEoaXJxZC0+c3Rh
dGUgJiBBUExJQ19JUlFfU1RBVEVfUEVORElORykpCj4+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lS
UV9TVEFURV9QRU5ESU5HOwo+PiBicmVhazsKPj4gY2FzZSBBUExJQ19TT1VSQ0VDRkdfU01fTEVW
RUxfTE9XOgo+PiBpZiAoIWxldmVsICYmICEoaXJxZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVf
UEVORElORykpCj4+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9QRU5ESU5HOwo+PiBi
cmVhazsKPj4gfQo+Pgo+PiBpZiAobGV2ZWwpCj4+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9T
VEFURV9JTlBVVDsKPj4gZWxzZQo+PiBpcnFkLT5zdGF0ZSAmPSB+QVBMSUNfSVJRX1NUQVRFX0lO
UFVUOwo+PiBgYGAKPj4KPj4gQ29uc2lkZXJpbmcgYGVkZ2VfcmlzZWAgaW50ZXJydXB0cywgYXMg
ZmFyIGFzIEkgY2FuIHNlZSwgdGhlCj4+IEFQTElDX0lSUV9TVEFURV9JTlBVVCBpcyBzZXQgb25s
eSBpbiB0aGUgY29kZSBhYm92ZQo+PiAgIGJ1dCBwcmV2ZW50cyBlZGdlX3Jpc2UgaW50ZXJydXB0
cyBmcm9tIGJlaW5nIHNldCBwZW5kaW5nLgo+PiBNb3Jlb3ZlciwgaW4gYSBzeXN0ZW0gZW11bGF0
b3IgaW1wbGVtZW50YXRpb24gdGhhdCB1c2VzIGluLWtlcm5lbCBJUlFDSElQIGFuZAo+PiBJcnFG
ZCwgdGhpcyB2YXJpYWJsZSBpcyBoYXJkLWNvZGVkIChgdmlydC9rdm0vZXZlbnRmZC5jYCBpbiBm
dW5jdGlvbgo+PiBgaXJxZmRfd2FrZXVwYCB3aGVuIGl0IGNhbGxzIGBrdm1fYXJjaF9zZXRfaXJx
X2luYXRvbWljYCkKPj4gaW4gdGhlIGtlcm5lbCBhcyAxLgo+IFRoZSBJTlBVVCBiaXQgaW4gdGhl
IElSUSBzdGF0ZSByZXByZXNlbnRzIHRoZSByYXcgaW5wdXQKPiBzdGF0ZSB3aGVyZWFzIHRoZSBQ
RU5ESU5HIGJpdCBpbiB0aGUgSVJRIHN0YXRlIHJlcHJlc2VudHMKPiB0aGF0IGdpdmVuIElSUSBu
ZWVkcyB0byBiZSB0YWtlbiBieSBDUFUuCj4KPj4gMy4gKipNU0ktb25seSBTdXBwb3J0IGluIHRo
ZSBpcnFjaGlwKio6IFRoZSBpbi1rZXJuZWwgaXJxY2hpcAo+PiBkb2N1bWVudGF0aW9uIHN0YXRl
cyB0aGF0IGl0IG9ubHkgc3VwcG9ydHMgTVNJLiBIb3dldmVyLCB0aGUgUklTQy1WCj4+IGhhcmR3
YXJlIGRvY3VtZW50YXRpb24gbWVudGlvbnMgdGhhdCBBUExJQyBjYW4gdGFrZSB3aXJlZCBpbnRl
cnJ1cHRzCj4+IGFzIGlucHV0IGFuZCBjb252ZXJ0IHRoZW0gdG8gTVNJIHRvIGZvcndhcmQgdG8g
SU1TSUMuIENvdWxkIHNvbWVvbmUKPj4gY2xhcmlmeSB3aGF0IGlzIG1lYW50IGJ5ICJNU0ktb25s
eSIgc3VwcG9ydCBpbiB0aGlzIGNvbnRleHQ/IEFyZSB0aGVyZQo+PiBzcGVjaWZpYyBjb25zdHJh
aW50cyBvciBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIHRoYXQgbGltaXQgdGhlIGlycWNoaXAKPj4g
dG8gb25seSBzdXBwb3J0IE1TSSBmb3IgdmlydHVhbGl6YXRpb24/Cj4gVGhlIEtWTSBpbi1rZXJu
ZWwgQUlBIHZpcnR1YWxpemF0aW9uIG9ubHkgaGFzIEhXIGFjY2VsZXJhdGlvbiBmb3IKPiBJTVNJ
QyB3aGVyZWFzIHRoZSBBUExJQyBNU0ktbW9kZSBpcyBzdGlsbCB0cmFwLW4tZW11bGF0ZWQuCj4K
Pj4gNC4gKipEZXZpY2UgdHJlZSBub2RlIGRpZmZlcmVuY2VzKio6IEhvdyB3b3VsZCBhIGRldmlj
ZSB0cmVlIG5vZGUgYmFja2VkCj4+IGJ5IE1TSSBpbnRlcnJ1cHQgZGlmZmVyIGZyb20gYSBkZXZp
Y2UgYmFja2VkIGJ5IGEgd2lyZWQgaW50ZXJydXB0Pwo+IEl0IGlzIGRpZmZlcmVudGlhdGVkIHVz
aW5nICJtc2ktcGFyZW50IiBhbmQgImludGVycnVwdHMiIERUIHByb3BlcnR5Lgo+Cj4gUmVnYXJk
cywKPiBBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
