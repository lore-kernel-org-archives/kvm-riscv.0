Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17445C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRH9qFyg/kBxP+n1iVnyreiPCPoGaDNcYZrQBIhEAvA=; b=KKE9m22C70c4ng
	hZwVaPoXpnDPEpWk2rw+IPcR/SPsBjY+i61O8FHBYu0E9iNgg2syUswIYSISShAQ2JDzZAU0pFis3
	/ZkUfgpiOK2/0LrXUYD4uKUIE0RC8pVNnCsrxhLeFC1FUg7ANTek7MJ8s4fVwTn+7zw+iCk0MSGq5
	xr452C4jmUSJsCJgO4apA3PYVCdTeNSZ7h426IV6wH+pWQB4b54mGzp4adHOJBlNxWsdy4KZ0e12I
	/lHmQMF8HtHgt1TAJBRPjjDVBhd15hiQ0U8QFrQE2+ilG48ERMQl3dDOnRnGGbbZYHJ2cVeBJDJs/
	R5vsT0y7s155zDH6GrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCqg-000000094KA-0ivD;
	Wed, 29 Jul 2026 22:34:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCqe-000000094JR-1IfW
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 22:34:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cedda2ce6fso13062575ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 15:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785364439; x=1785969239; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmJqv3LbtEXaKjjxddFIB/CCzuAW9BtsEymREcKNJvA=;
        b=qBN8Lad5xZVnWVRMSV74IKVCnNe8SR8LjokaLKYPovfY6AgpCynxcef7zfY7VHjYO4
         pyAIShH+cnUuRfIN+bW2vQlQP2aNWFsod3n83F8TDKo0wsUtW00hukc1gIBx6imu3TJ3
         aZLceKzxmd71coalvTX+vhUu2lPWvKPLTYkdeklPjQLXDifdNueW/mXM9T0dFSQcHM+J
         yXVdaM2BEWhOA3V9sdfHq0IW+8OOxnKyp906q8VvrDCZ83Up0gZ5dH++WITWrvLe3Okx
         osi5TOziiHV1oCjz6x60nd43We98iOQTV+poP/IOikK2+C9Hd5BBHmiy2INNWR7TYNpc
         c08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785364439; x=1785969239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmJqv3LbtEXaKjjxddFIB/CCzuAW9BtsEymREcKNJvA=;
        b=B+mVZsApM54MOHP+RCHOvuOjynCUU+lFycLJBDaOjYeqGATp7DG+dqF7NeVZoYgT3q
         Uieupm9aySeo7GoIt7LH9lkOHb1mqj/yAfwKKxprxI8hEKsDPHQnGcz6i+MeXGxmtcHD
         4jJ5c/Mgk6nr8tcbLCdDeRnfUbpnIsbrGqOqC7U5LbjtwG97DbHwa3tzd8PpzK203IPg
         m7LkXYR/Ap/aaeBx7wm8smCCfsalXvrLc+04NdNnhTXbbqlmaW1Jikwfaz0LPerWewn/
         re84B0kQHFSntmat9vIKlsN9s6YJU3uKZ2HlVzqmXMVBY3+jPeimecLLnliYoulDDSUj
         rlvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzfQPGQbqqgdPgQYMH1mqRBPUuId1zY4U1k+xIc3NWVQEf+js6z2RA/ZjLpp7EM3qYhX7dP6vdOK4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrdBArc7Hf0ABD2rdysTkp2eH09b+1X+eHY2aBrKrBOWdo8Th6
	S4Mqzc875QTqvYm0mT/mBSUAd92hDNClTOj4I2+9TwiaoAv0/A0c9pPBP2+41/1n
X-Gm-Gg: AR+sD12yK+1nAoS6GW52TbHvttfkQ2QIeYB7rtb9lvN2RTwpe3cIAxp2tFiBm0tqqC9
	PZT9r4JamIC9b3AnwUyZQy0ZwISuyMlqY0dI5dcJ3tHlByvkPHbGG9WxNXsuYTMveiIAyI0qdqr
	Hxa0X1Xi+3ErV9g01N6oL+BeJdxeshvMn4wacQm3+2Nobjs+JhzHDoihCFvO+iXYIb5qFcItFLv
	GdTuEOnTRavVX/uu2lPGaI94s35GhDN0/VOZgeWmYqMwhNfP3yZYXLn/UsLEcyrA/z5+gZaCvpV
	yQD3tAgpTnICRijsKacQAXmCC1I4xl92HeWmxnUyhLGJr5BozEGDjZ4ZXfjQxBO/6rc7UYFH42g
	Y/eve9yJ5LYwzy5ZoOPHTWS+qZ917ZDoX6Un77mcATdA8aZ45yqOYBHqyMGHxN9R0rOJcEAgSTT
	NDOe+89jDHHCm9m5o3TmliRDgn/DP1kwI7UxyT1GIqYPJGS1LV3ALk35HtGSw=
X-Received: by 2002:a17:902:e888:b0:2ca:d151:383a with SMTP id d9443c01a7336-2d035c10f84mr2037815ad.20.1785364439062;
        Wed, 29 Jul 2026 15:33:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a468f7sm17125555ad.28.2026.07.29.15.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:33:58 -0700 (PDT)
Date: Thu, 30 Jul 2026 06:33:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable
 it
Message-ID: <amp_hOi78SGkPjAp@inochi.infowork>
References: <20260706021154.210289-1-inochiama@gmail.com>
 <20260706021154.210289-4-inochiama@gmail.com>
 <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_153400_351933_AAB14F17 
X-CRM114-Status: GOOD (  22.71  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMDE6MzI6NDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEp1bCA2LCAyMDI2IGF0IDc6NDLigK9BTSBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgU0JJIGV4dGVuc2lvbiB2YWxpZGF0
aW9uIGNhbGxiYWNrIGNhbiBvbmx5IGZpeCB0aGUgcGFyYW1ldGVyIGlmCj4gPiB0aGUgZXh0ZW5z
aW9uIGlzIGVuYWJsZWQuIEhvd2V2ZXIsIGlmIHRoZSBleHRlbnNpb24gaXMgZGlzYWJsZWQgYWZ0
ZXIKPiA+IG1vZGlmdHkgc29tZSBwYXJhbWV0ZXJzLCB0aGUgc3RhdGUgb2YgdGhlIGV4dGVuc2lv
biBpcyBzdGlsbCBicm9rZW4uCj4gPgo+ID4gUmVzZXQgdGhlIGV4dGVuc2lvbiB3aGVuIHRoZSBl
eHRlbmlvbiBpcyBkaXNhYmxlZCBzbyBpdCBjYW4gaGF2ZQo+IAo+IHMvZXh0ZW5pb24vZXh0ZW5z
aW9uLwo+IAo+ID4gYSBjbGVhciBjb250ZXh0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElub2No
aSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gPiBpbmRleCBiNzM3ZTlhN2ExMmEuLjNlYjdi
N2M1NzA1OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+IEBAIC0yMjEsNiArMjIxLDcgQEAgc3Rh
dGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250
ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBr
dm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqc2V4dDsKPiA+ICsgICAgICAgY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmV4dDsKPiA+Cj4gPiAgICAgICAgIGlmIChyZWdf
dmFsICE9IDEgJiYgcmVnX3ZhbCAhPSAwKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4gQEAgLTIyOSw2ICsyMzAsMTUgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9z
YmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiAgICAgICAgIGlmICghc2V4
dCB8fCBzY29udGV4dC0+ZXh0X3N0YXR1c1tzZXh0LT5leHRfaWR4XSA9PSBLVk1fUklTQ1ZfU0JJ
X0VYVF9TVEFUVVNfVU5BVkFJTEFCTEUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4gPgo+ID4gKyAgICAgICBleHQgPSBzZXh0LT5leHRfcHRyOwo+ID4gKwo+ID4gKyAgICAg
ICBpZiAoIXJlZ192YWwgJiYgc2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0g
S1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQpIHsKPiA+ICsgICAgICAgICAgICAgICBp
ZiAoZXh0LT5yZXNldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXh0LT5yZXNldCh2
Y3B1KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0g
dHJ1ZTsKPiAKPiBMZXQncyBub3QgYmxpbmRseSBzZXQgImNzcl9kaXJ0eSIgd2hlbiBhbnkgU0JJ
IGV4dGVuc2lvbiBpcyBkaXNhYmxlZCwKPiBpbnN0ZWFkIHdlIHNob3VsZCBzZXQgImNzcl9kaXJ0
cnkiIGluIGt2bV9zYmlfZXh0X2Z3ZnRfcmVzZXQoKSAoanVzdAo+IGxpa2Ugd2UgZG8gaW4ga3Zt
X3NiaV9leHRfZndmdF9zZXRfcmVnKCkpLgo+IAoKR29vZCwgSSB3aWxsIG1vdmUgdGhpcyBsaW5l
IHRvIHRoZSBrdm1fc2JpX2V4dF9md2Z0X3Jlc2V0KCkgaW4gdGhlIG5ldyB2ZXJzaW9uLgoKPiA+
ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICAgICAgICAgc2NvbnRl
eHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPSAocmVnX3ZhbCkgPwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgOgo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEOwo+
ID4gLS0KPiA+IDIuNTUuMAo+ID4KPiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKClJlZ2FyZHMsCklu
b2NoaQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
