Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D17CD4F25
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11vnGUAfZ21gLqPBS7asEXaeYdwdngnD6fy9cWU3kHo=; b=xE/t0xDCCSHbQN
	V5sOsJNDGyFUDJiLufPlPJ2cibsnHKbkfTr9rvyxl/SePUXMLiYaJjWlXnYUZQaJA+3WY3DEbqL3q
	Ppde5tyoqh6NrOQpYt6lNea5cjy8CPpieBfYvz1pxQqkwmQXX58VIx/45G/hPiiRDMpxkhB1xb+17
	mpa1EO/v/DjzYA1n0TG9uAMkqlf6MwmLFfQnA/gGssdZ4NZtsY7cTIeg0kZ0TU4ksKLGLgtTLHq1i
	5O8eO279eVA5l+SnWsIC7L3BpnPy7taN165p19erEY4FYCflJlMQ0GO65dGtbcU9BhttSklnNeIYI
	1CK7dPxYhtYXlm/xw8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtzA-00000008dVc-2yL1;
	Fri, 15 May 2026 14:57:56 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtz8-00000008dUi-1efH
	for kvm-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:57:55 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7e4004a4a6fso1920466a34.1
        for <kvm-riscv@lists.infradead.org>; Fri, 15 May 2026 07:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778857073; cv=none;
        d=google.com; s=arc-20240605;
        b=PHyPHx+eGWB0UENQup9BalM+RjorX0RBwepL9zPMBJt1gxp2odVt3AoQ4CL0ZqWwtp
         0RcOxgcfTZ/29mLehcSPsAFIaBZCAkIC0GOCxF8ferY1bOSALfiO1tXWKe4y5QJrfgM+
         4E3Qc97lxwXs2Le919YbdTyz9espDgB+5qGfpjxDJCgm1DQjAiSqv71aZP7sZ5ZwEJ+x
         Gb6Xwal4IdmKxU+A9rJF1zg7xd3kZ0b0D16MwH8AoR/EzmXCaORg1t+ePDNywPN7yFlH
         7JKrLhc3zexQsWMXSYiNVVKRogrESq3P7vFiGoSDknKYm/39eSjgMVum5bFm0iiozYtS
         b0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        fh=rbuEIzsYIr6/Ci4u+weYs2vcyXyAM8lWXjs5fQIK+YQ=;
        b=dMDR5JqGmDHG3CgUnI/qH7qn1G79TLEzos9qqt45ZYlAz83oQXgRQokBrOeYjFvYht
         TJrSEF9VyadwiEEQUOHGvsDtVorchqbJaWWIvCzeNd4HU87fEmOvQ9ntIlHwUhkpc1Mm
         Lx0RtJ+BvO9wOMo4YM1FkatUg1hNZVdiXnJQRrpDjAm82ETZWGvD7i6s6sv8tpoKxNDB
         SZMFAwf/Nxu/qilG1DL9OwOmGrsIN/Hfig2iEiYr9hZG2vbA89BSZ1I5bstEQtShFLeh
         tOjlg6VdTV4wxcyt6nPedT2wmOSe4/PRxVyUfBPFGzPTmfE9sjNbC6jQbDUoJyr+B8Nn
         nvFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778857073; x=1779461873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        b=N17nvHwoPHD3An6vxWnH6laAVUUFqj8FL+Z+tn0R18/ZTRoaEaHwWES0Mx7wcCAux5
         xG+9yLDCYKFeHdx6yLzz50nSkKvfH+jCnGooNTkT1aHQnUjW2XT6A6yRyDML/6+eqxV2
         bGoCNXRT7M5YS6TWBnm6wFTe/KoCBVsbGQ9xMptpwwnTpOtAT6EaWOCBdYiqz6+4ZKjh
         cX2NJNVDMgy/wQSj95VA4CI8+K46eXrSqGFPDZ3A4A3RXqZFqoj4Y5UCDgmDAZdLZ3Dy
         fRm89RW9alBcxVJAjhBgtd6BRaptghlw+jyByrNh0Ch/mBBZmiJHQCkw6Z0nYcKUX+/V
         k6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857073; x=1779461873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3t1pOxjg20Z3wcl0vvYq5Ty0ZflWEwctqSCHyvpXyd4=;
        b=Q+w0nrIl252EzpQJviw7OGWGKHr+n7XpLOZHAS2t4/aYArpRyosGefHQF6g87TgrDK
         fJodcEy4A1I/asZmzfZHKUOYrNmtOcAAssMB6Go3L+8wg/LkdYyjXGemUgajzE9Kcz6K
         fOsINuFjCO0UcdcyX5kB8aDIXj070vdbytfBgQQ2RWnOnxafC9O9Azu397mRWLfEOHnI
         3o/Jg8ggyAPCtalOX/A/yvlB/7hQ+aZtFhZAlzi+kdQehlc/TUFx6oCz25advcGcBPml
         qeXLc/yUSOSUBfAd7zVFB+nDTBfVLnTW+gAGs4uKttWfBvEEePq4WLDqVpQp7Ascbyma
         6y1w==
X-Gm-Message-State: AOJu0YwxfOacZ6z4gIPsH2hBs2f33zB90FEaYRgpTgjInCg6aA+VefDe
	FSHTlE4FbJ6kbKcDWjE+lNsaeRZiUBhwl7xlqnVxq1JE3//QlepCakndIzx0FYJA5KhDHQYeC8W
	ndrPIBoCJHETqkObp5o4U3szlBECa6rUWAyhdFWZXVQ==
X-Gm-Gg: Acq92OEjFXY1YJcwGas5ZWxwDH6A/Bh9QLnqOONuqAuRtSxA1Iy7evyY516Kgun2ZSz
	fWxqv//4S3X6VFao84x/VTZiKGLLjlXb02UtcM9torAlD7x2X8PM92ZURY51rR/JsMcBsMl1Dv/
	D9+RcdVB0rKBHVIlds30j+mOjx3n1dbBdaUr3AmfzTa6F1T45qzGV7yve9bWiAjkEpDqThBwBYT
	HqndSi2CgS6qSjkmzcdH0rhx4iwKSVLpHYpkN/Za8wuHTJktTG8BHY081u/2EuW+/qd6Vk+fae1
	+pM9d4u3DBm6M984PKnKYLJhBREBkqJivISCNfb4Wb6KNczSn/fxApMDSVHx4x9ZcXET3Tngw81
	whehSpiYfqmJ/wHaHwXmELIoDVns=
X-Received: by 2002:a05:6820:c81:b0:67e:3ae6:9031 with SMTP id
 006d021491bc7-69c9bfc803fmr2593844eaf.59.1778857072918; Fri, 15 May 2026
 07:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260513092650.2386205-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260513092650.2386205-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 20:27:40 +0530
X-Gm-Features: AVHnY4IC21LFp6nss1DoEsQGb_rfcL825pTbxqa9a4YrYi4kf6osVuSSox6fKAY
Message-ID: <CAAhSdy08enoCH83begksrSA4strPG5n5Wd4i+ext0Z+Wmz_OAA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1
 SEND_IPI handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_075754_557711_02C2B124 
X-CRM114-Status: GOOD (  16.87  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjo1N+KAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTQkkgdjAuMSBTRU5EX0lQSSBoYW5kbGVyIGl0
ZXJhdGVzIG92ZXIgdGhlIGhhcnQgbWFzayBhbmQgY2FsbHMKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQo
KSB0byBmaW5kIHRoZSB0YXJnZXQgdmNwdSBmb3IgZWFjaCBzZXQgYml0LiBXaGVuIGEKPiBndWVz
dCBwcm92aWRlcyBhIGhhcnQgbWFzayBjb250YWluaW5nIGJpdHMgZm9yIG5vbi1leGlzdGVudCB2
Y3B1X2lkcywKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQoKSByZXR1cm5zIE5VTEwsIHdoaWNoIGlzIHRo
ZW4gdW5jb25kaXRpb25hbGx5Cj4gZGVyZWZlcmVuY2VkIGJ5IGt2bV9yaXNjdl92Y3B1X3NldF9p
bnRlcnJ1cHQoKSwgY2F1c2luZyBhIGtlcm5lbCBjcmFzaC4KPgo+IEZpeCB0aGlzIGJ5IGFkZGlu
ZyBhIE5VTEwgY2hlY2sgYmVmb3JlIGRlcmVmZXJlbmNpbmcgdGhlIHJldHVybiB2YWx1ZS4KPiBJ
ZiB0aGUgdGFyZ2V0IHZjcHUgaXMgbm90IGZvdW5kLCBza2lwIGl0IGFuZCBicmVhayBvdXQgb2Yg
dGhlIGxvb3AuCj4KPiBGaXhlczogYTA0NmMyZDg1NzhjICgiUklTQy1WOiBLVk06IFJlb3JnYW5p
emUgU0JJIGNvZGUgYnkgbW92aW5nIFNCSSB2MC4xIHRvIGl0cyBvd24gZmlsZSIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9m
Zi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IEFzc2lzdGVkLWJ5OiBP
cGVuQ2xhdzpEZWVwU2Vlay1WMy4yCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Yw
MS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV92MDEuYwo+IGluZGV4IDE4OGQ1ZWE1YjNiODUuLjk4ZWNmY2IyNDY5ZTYgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV92MDEuYwo+IEBAIC01NSw2ICs1NSw4IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9l
eHRfdjAxX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVu
LAo+Cj4gICAgICAgICAgICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmhtYXNrLCBCSVRTX1BF
Ul9MT05HKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcnZjcHUgPSBrdm1fZ2V0X3ZjcHVf
YnlfaWQodmNwdS0+a3ZtLCBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJ2Y3B1
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CgpJbnN0ZWFkIG9mIGJy
ZWFrIGl0IGlzIGJldHRlciB0byBjb250aW51ZSBoZXJlIHNvIHRoYXQgbm9uLWV4aXN0ZW50ClZD
UFVzIGFyZSBpZ25vcmVkLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
