Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937CF51415
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH04gcH0p0Jlsd5iEhleJmh0tqNYTzypo3doFRh4xM4=; b=kI+7th1kvkd8FO
	Wy3EkLZ2dcZKODg4oePfrxkZBaXWB/ypLh7RTedWLu1RMklFEdMvkpVqlaYwr/UJHvqv+4Drtn+lP
	uMiF/lQvDan4g5uU6pVz2Q1TRkOe4zEauW2ofZTNhvg4mWiDooLMTsXoR+j1lD63dr8iFoRy1f08u
	L7PRSVSV90Df1REi53Eh7MhQ7psFRBqhtONQ0I4wt/YcdbBbeh74ddmc51aP2raODI2NkCI5imKdU
	YlTmcyX9S8eHKkwWoWCYFvIcAbLPQ59DTDFqkmy2mI+KH4lzsypEWqdI5+XQ2PJ7DvFsIXsB8jwqz
	WeOj84skMyj4qrGAWwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEz-000000037fj-0h4B;
	Fri, 06 Mar 2026 07:04:53 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEv-000000037e7-29iA
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:51 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-662f5c5507cso7213193eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780688; cv=none;
        d=google.com; s=arc-20240605;
        b=g1ZTV8FjPztYbZAaZSX5NBc7pYaPoCDpSDQHKHH8BOFL40e6L6Q/msM5HJTepKdoBd
         EEwwAWIDSKihx0HJ5pYji7ECS4R+htyfzdodM/T6nRkosf/UKZe4L+1yZNLwSmTvhp63
         WhwSJ1/zc+wK2ZRwrLi+l9DUQDhrLBb1KT+sWhs7yl6/J2a3/2+Q53RPMJukr1GK4k4z
         lY6iVX+ULpyxtSZD/Zybx8myhp+uofB8j5f+rRkbto64zJg0fxLgRXbhdxhS0COkyAHW
         JcZYoL0Ef6edjMUJW9wx3EQ9nNA9QRVBYbgme6VXY0SPQ27AmTw2jOVEBkfWVmVM861K
         MkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        fh=RdTKvkSjbmKEViRsw67QL1p8JQQlQAIZd6uL30+cRsw=;
        b=ScPbyh8WIC4/6KXzrStYS0mDquydEslsDh7AipE7u4sTC5O+SqIGoAiYTrzYlu8r/w
         CaKaCD/lIanI5EdSL0RG7VmjP0DAl5EMk2BTu8cHbkxhN7xzg9nDLsQ2oRU3dxBe4pEy
         ix1LcoFOMT3fG9/ji3e0xDbt1igmXQJ4UEtiOUAPysdJt/EsFPpIcqqHT85UGCYa89x7
         vXWHYF+PqXAZ49annHQGL/1hxHohk71MtfLwh4cgjaszjjWDxy1rGqV3sdpk3pXG/EnZ
         6A/6DtcE4hxjg7t+7QnbsVhh6DrpbbmrxjTOZVKi1rAqzkqr/ApjG45AYMy0MK6/A/LG
         /FUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780688; x=1773385488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=IaU7w5FryBmhmPs/OL6OJ69Vk2UPDG+wUDtKRZv9lv8kQP2lla1Q6SOIpoPd/pRHRk
         wDNV3edgdt7I0q4bGocOAEQ5Bkkb5kdvNtaBIh5YaqgOxWghdoJU+IPKvyoFXL5VbkYa
         MpyqT9DY+g52TFo7+tbsF3GjgSdSnHk9oJDTFH/QhQmqL/bH1yRH6BX9m2irgdrARoFw
         sNt69jomt3h9If6DlmVwiKDILTqtz9Evi1Amj9HHOOBDVQErvutV60dGYT7O30u4JUJV
         UU0/lP5hUkykJc5fGcFDAZCj1g/W/C8x/fx8bIQQCEkCsETcZdtS+mjFSKWikrrgnpIc
         UPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780688; x=1773385488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=EGN6WBn1zOeehEby9ZIy9/R1qbOqYr8zw+BJzh+ie0CEfcmyY/tJz0rM3ilNcRT+kg
         qNBQmvUUGPb/8kMJj6Tlvih8nPsXmgPvqnElgnvDT6eSONcQLCGfYrLjTq9GWsrcoGKD
         BHiXdtd7YywVnMV3plKMa/8BwUATIJnIcqWu1McSyKTbuAJPsRYhoUUHxTFmwjtws9A2
         cbNkl6+sZz3eqwCbqtg9Cj2KA3+x96CYBDZjc687Huu8N4VNxnHAhV3u/6D2x91LzJul
         3UblQJ5p9+CJj1rTPIeteg1GlzK77arH8cCeIDmj/EN9QLL9SEJUuA7KqJ2pBbvv0qBS
         sg4A==
X-Forwarded-Encrypted: i=1; AJvYcCXr7xSGUHbqkdKk0cKj2yJDU6yUzwO0uLtV7L7BP0Q9NcrMFdQkkNzKfihYjJRI+TQTV9ab5R3bTK0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPfkWZLibJ3kN4SJlCR+ONjoW4vMGSl6rcb3LCeNj7ihrQLvLB
	f9suhzJuzGSWkAONEARb8v1uNTG4BGtgxTKsMU50HPat7J6Lkj05X7dIPzZ09XReDJPfM4D1tDn
	oEycboMhVJo93thY8DGV7U1rlCdmsFaTyIO8+722e3A==
X-Gm-Gg: ATEYQzxs8tMbxz0a8CeVuRVH3al/w6s5/c+ecvH08KiLeP+CzIdIOZE3x2TWEoNlI/O
	aZTBkCnB4Wkm5591en02U5A5iWuYITqXPnijkGFHYdaA8LZMBvqOH2f6dOWl+m0QcuW0wIEYKTd
	nd8AbbHFlJs3pu+IxwNA1dvShtY9cGORRxDjt60jpFHb/mMBAOX5gUFMhNBYXknJZm8gUExk3gR
	EC0QOBPgwzZjRhD9yoazp2tio9DZ4Qz4b2vX+xIrFAlzNUZuGOsKWzPxML4Y+uUiUwP/it7q/7y
	nOEC5dZvoGJ8L9fc4Ppw4uf17qv/z3uVl1mkWdeYbn3oaBASbN+77NzxC15wYhaJF/t8Xgm7+2x
	EjZhlVPIX8ox7XChxwBSaC2DXyg==
X-Received: by 2002:a05:6820:1ca3:b0:67a:3dd:3fe7 with SMTP id
 006d021491bc7-67b9bd2ef0fmr746008eaf.47.1772780688470; Thu, 05 Mar 2026
 23:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:37 +0530
X-Gm-Features: AaiRm52vplQjZIJ_yYHgtG1kWnM8unoFggovyMF3JIYyAr9uZDY-IpREqe4Zs_A
Message-ID: <CAAhSdy1jeJVHgABQxEzKCqYKLQteVkzM6p5mz2vJBY5A0gmFkg@mail.gmail.com>
Subject: Re: [PATCH 03/27] RISC-V: KVM: Check host Ssaia extension when
 creating AIA irqchip
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230449_688534_1E814898 
X-CRM114-Status: GOOD (  12.80  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIHVzZXItc3BhY2UgbWF5IGNyZWF0
ZSBLVk0gQUlBIGlycWNoaXAgYmVmb3JlIGNoZWNraW5nCj4gVkNQVSBTc2FpYSBleHRlbnNpb24g
YXZhaWxhYmlsaXR5IHNvIEtWTSBBSUEgaXJxY2hpcCBtdXN0IGZhaWwKPiB3aGVuIGhvc3QgZG9l
cyBub3QgaGF2ZSBTc2FpYSBleHRlbnNpb24uCj4KPiBGaXhlczogODlkMDEzMDZlMzRkICgiUklT
Qy1WOiBLVk06IEltcGxlbWVudCBkZXZpY2UgaW50ZXJmYWNlIGZvciBBSUEgaXJxY2hpcCIpCj4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgoK
UXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRzLApBbnVwCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9k
ZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IGluZGV4IGIxOTVhOTNhZGQx
Yy4uYmVkNGQyYzhjNDRjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2Uu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IEBAIC0xMSw2ICsxMSw3IEBA
Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvY3B1ZmVhdHVyZS5oPgo+Cj4gIHN0YXRpYyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qg
a3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiAgewo+IEBAIC0yMiw2ICsyMyw5IEBAIHN0YXRp
YyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiAgICAg
ICAgIGlmIChpcnFjaGlwX2luX2tlcm5lbChrdm0pKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVFWElTVDsKPgo+ICsgICAgICAgaWYgKCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShO
VUxMLCBTU0FJQSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsKPiAgICAg
ICAgIHJldCA9IC1FQlVTWTsKPiAgICAgICAgIGlmIChrdm1fdHJ5bG9ja19hbGxfdmNwdXMoa3Zt
KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuNDMuMAo+CgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
