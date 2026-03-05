Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F36EDEC05
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv6WrtCAjl87KvP1yYhCSbMQ4qurcyrVSU96y9Vcd2c=; b=lYp3r0CEjUXNKF
	nsAS9MD8/vbpJvb1WaAR/yfCdV9L2+3hvW6vi0wgOWhiuIQ8Xus9pMWvsi5NNvfYVh4V02hJjAXo8
	jHJAWvTZtamjPOBRV+o4ZxVqVLn/QwTPm9OUjr+MrXRuzykrlT3ZEw65eKDSOrsLJ4haoOCfGxFIP
	/8BV86+5cifVKvPMISFhAX6f4NXVirNmTnwiJ6Yvd9vED5wfxq+aBDlJdEJkMdtEsD27L/F0FLGPM
	7JG1qFAjmAUmjCSwJO6g4o8slWiijb5EV3UWGhm5ItSOtlfGguP6gWTuBpb4OUfxVqXZprB7yEbBB
	63l8XsxHVmoLCSEOMu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8n0-00000001t0v-3FwN;
	Thu, 05 Mar 2026 13:30:54 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8my-00000001t0D-1ksB
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:30:53 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6798f3b7163so6216559eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 05:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772717451; cv=none;
        d=google.com; s=arc-20240605;
        b=YWMtxIhphhVs0eyPPkWWVrCdAIG7XvgixH6p71oJ87ZJzd7PU/OhwE8AbP68VBGsiK
         Uvt7xbDFCygQXFLl1prYkt7rmwOUfGTMFNFAFEb9PE1wk0WRC8Y/wTCrtVXmqPXrCHLk
         Ee77O+bAAJ1qw+B2YVk01N0UsjKTd3UjdWNBuvBJbQcJxGdSRfw2G3zrLntjIDY9Fi8T
         KldXLc9U3MDsAauu5R2oUYJpUBN8/IUoIhjYG4Yak7+GdUi3+Cj6NUa1rCXheYzmvzx5
         4PJidJE/nYui2oaaOQwCRHqMfWBUADjwa9CjEdAUckJ6dV+fFDdoaxZMKaNvfJFa/gSa
         Pl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        fh=r47r1Tof7dNhPAZ+AOu7gl2kQELbvfIl3Xa9WYioa3I=;
        b=kLOH1Sz8fR6zILjjzvKNXqO9otChquHl1wT+MeGAVoG5eBRxSp6eyGqiHyEv4fg7jL
         QNGQugqtjf41WCaJKdBJAlScrI3GdvEiKI9gzo75vjyh6wrE3SOu0pAQEZ7gG3Zt0Jds
         VywtTdZogXWPt1+NuZhHe8IoZb0XAnOuuu4dfogxtu1n3fATkbJafRz7lCnYccRQEwG5
         p2+n6x5GhLnPyIaf6HH2l8z5g78f9NsRpNl+mVNg+q61BC6M+HhumnRw+wUIN/CGaGk6
         x4v2HwOhSE7W0ZdhRxiaTeQlzOMKa7BVG4QLdCbcuuZUS61Fa4Zn7DaOZ+hg8YS08Kk0
         Esig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772717451; x=1773322251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        b=tFkR9WtPt95n754c5GbmQGRDnK9rDiwW+LgVbC3Tdtja/qCctTay2lLttzSYwLnbaM
         bBnOCeklUE2kEkhR4AVlpKqbaj1qpkVlKDKi8DKU51qjF2xXKE3KOfnYnpZVxzlBA6gc
         qsPYEYlzMhdjpURXIJkvQzVGMSeNLntKtzPV8uklGVbNkMbwPFFbPrinC24ZNUqQzB1Z
         HyMrWHxbhMgaEFAN+LUaSC2NJAMCol7hBQa0mpR7lvR8W65LOFNjdh26AfjnRgPkEHq/
         EMjnEMpoC/iyWQpxztQ/q/C6W2SYdoVVrAlMWAe0SrV4B2toZEU/2Ta0Kmq9p9HDLWV+
         Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717451; x=1773322251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        b=O86GW1lPNJGM/pyiyVfaX42JT4jY0kaIk63KfCxtON15ivENNWRjv8dziF/M5etp1v
         OwjyW5xEBt53PV/rhHFlca4LU/PVzTDlAFKyIQqX6WjHHDkk0+HcS10IC+6x71V2ipIL
         j5F+2nKg2DTu5ABbVrhdAv6uUKKnFRlDSHBL7QpnssUcKOJYvwXYnmm3jJ7dtGXuFAvv
         QtrsHlZApSiu29H3bghcILYE8S8/dvQLGUT2qSJ90G4VSg5KtfWeLz8wLBcTc8uP6O6r
         wdpdRC7Kl+dCtW7uxI8l0hmYOIzRyUUIOmSM9nq6hUEOzzzmwcYtGcJbfx1qwJO/VZGq
         1Siw==
X-Forwarded-Encrypted: i=1; AJvYcCVG8hd3onzCku4oE/V0g0Qq53+QLAplZutdnDnknGVf1zjpA0iIB6l+MQNquSKBi55mx/tUR8l5Rzg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQlhWHt7LIfkgBs3TR6eJI5CA5WUMJU4bTaGiMnZ2lIyciSlrV
	4fhlBZ2JI1KJN/bVk11Q3p5aiOcRrPulny8TeVjzhiLDvcr6jDxa+Uun0QW++CkQpfdxc8vQJ+3
	GV3/sDKgD+y4Dln5MnCevGuuUGAAK20H7/j1HPRkDng==
X-Gm-Gg: ATEYQzzORtkSdmA622/++jHEcSSdEvo9AiuCfOEbAwyG+rv8uzdr+MGnOoEw0fTPyf4
	rtYnYJXsNlopNRxZ1dg+/ZZ2jiIpZupsM3VwxmQIY84C/op/A+VRhVvlvWg3rqPs9029weZH4J0
	iO3H9TeGB5ImIOHthTNpuEASeBve4Y7loGVY07gamztF5gPav15FBxaiGiauLzpK4Fz84CCbz4x
	GoDDSvKRK/FZql8l5VogMKBfmYLWx5GVvk8IXK6dbXF4Q7753llufEo4d8RufOQFf5cBIQghx8Q
	7vbUieZ+Y9qzlKzOfdlYvE+KWfZnCSTLxQvQvTG/8wjD7PadZpMLcQU+9sHisi+JGe+rU2A4TUn
	Ycvbv1WbTgC75JWh0MXYiSLkhww==
X-Received: by 2002:a05:6820:4c14:b0:66e:61cc:80e9 with SMTP id
 006d021491bc7-67b177492dfmr3329436eaf.47.1772717450875; Thu, 05 Mar 2026
 05:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Mar 2026 19:00:38 +0530
X-Gm-Features: AaiRm52bujvrz1wVs7wPhlkcz9NjaN9CVJbTQxzpaKmaFZPorRalJg79gkEOupo
Message-ID: <CAAhSdy0zfm19ucQ3c354VZ5RDEN+ztG1ZRHzVReGYAXS+aid_g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix potential UAF in kvm_riscv_aia_imsic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_053052_717562_3CBC9E88 
X-CRM114-Status: GOOD (  21.13  )
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxOjM44oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIEtWTV9ERVZfUklTQ1ZfQUlBX0dSUF9BUExJQyBi
cmFuY2ggb2YgYWlhX2hhc19hdHRyKCkgd2FzIGlkZW50aWZpZWQKPiB0byBoYXZlIGEgcmFjZSBj
b25kaXRpb24gd2l0aCBjb25jdXJyZW50IEtWTV9TRVRfREVWSUNFX0FUVFIgaW9jdGxzLAo+IGxl
YWRpbmcgdG8gYSB1c2UtYWZ0ZXItZnJlZSBidWcuCj4KPiBVcG9uIGFuYWx5emluZyB0aGUgY29k
ZSwgaXQgd2FzIGRpc2NvdmVyZWQgdGhhdCB0aGUKPiBLVk1fREVWX1JJU0NWX0FJQV9HUlBfSU1T
SUMgYnJhbmNoIG9mIGFpYV9oYXNfYXR0cigpIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZQo+IGxhY2sg
b2Ygc3luY2hyb25pemF0aW9uLiBJdCBpbnZva2VzIGt2bV9yaXNjdl9haWFfaW1zaWNfaGFzX2F0
dHIoKSB3aXRob3V0Cj4gaG9sZGluZyBkZXYtPmt2bS0+bG9jay4KPgo+IFdoaWxlIGFpYV9oYXNf
YXR0cigpIGlzIHJ1bm5pbmcsIGEgY29uY3VycmVudCBhaWFfc2V0X2F0dHIoKSBjb3VsZCBjYWxs
Cj4gYWlhX2luaXQoKSB1bmRlciB0aGUgZGV2LT5rdm0tPmxvY2suIElmIGFpYV9pbml0KCkgZmFp
bHMsIGl0IG1heSB0cmlnZ2VyCj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2NsZWFudXAoKSwg
d2hpY2ggZnJlZXMgaW1zaWNfc3RhdGUuIFdpdGhvdXQgcHJvcGVyCj4gbG9ja2luZywga3ZtX3Jp
c2N2X2FpYV9pbXNpY19oYXNfYXR0cigpIGNvdWxkIGF0dGVtcHQgdG8gYWNjZXNzIGltc2ljX3N0
YXRlCj4gd2hpbGUgaXQgaXMgYmVpbmcgZGVhbGxvY2F0ZWQuCj4KPiBBbHRob3VnaCB0aGlzIHNw
ZWNpZmljIHBhdGggaGFzIG5vdCB5ZXQgYmVlbiByZXBvcnRlZCBieSBhIGZ1enplciwgaXQKPiBp
cyBsb2dpY2FsbHkgaWRlbnRpY2FsIHRvIHRoZSBBUExJQyBpc3N1ZS4gRml4IHRoaXMgYnkgYWNx
dWlyaW5nIHRoZQo+IGRldi0+a3ZtLT5sb2NrIGJlZm9yZSBjYWxsaW5nIGt2bV9yaXNjdl9haWFf
aW1zaWNfaGFzX2F0dHIoKSwgZW5zdXJpbmcKPiBjb25zaXN0ZW5jeSB3aXRoIHRoZSBsb2NraW5n
IHBhdHRlcm4gdXNlZCBmb3Igb3RoZXIgQUlBIGF0dHJpYnV0ZSBncm91cHMuCj4KPiBGaXhlczog
NTQ2MzA5MWE1MWNmICgiUklTQy1WOiBLVk06IEV4cG9zZSBJTVNJQyByZWdpc3RlcnMgYXMgYXR0
cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWpp
YWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQ
ZWFudXRAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4IGZvciBMaW51eC03LjAtcmNY
CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA1
ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jpc2N2
L2t2bS9haWFfZGV2aWNlLmMKPiBpbmRleCBmYjkwMTk0N2FlZmUuLjlhNDVjODUyMzlmZSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS9haWFfZGV2aWNlLmMKPiBAQCAtNDcxLDcgKzQ3MSwxMCBAQCBzdGF0aWMgaW50IGFpYV9o
YXNfYXR0cihzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2RldmljZV9hdHRyICph
dHRyKQo+ICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRldi0+a3ZtLT5sb2NrKTsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEtWTV9ERVZfUklTQ1ZfQUlBX0dS
UF9JTVNJQzoKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGt2bV9yaXNjdl9haWFfaW1zaWNfaGFz
X2F0dHIoZGV2LT5rdm0sIGF0dHItPmF0dHIpOwo+ICsgICAgICAgICAgICAgICBtdXRleF9sb2Nr
KCZkZXYtPmt2bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfYWlhX2lt
c2ljX2hhc19hdHRyKGRldi0+a3ZtLCBhdHRyLT5hdHRyKTsKPiArICAgICAgICAgICAgICAgbXV0
ZXhfdW5sb2NrKCZkZXYtPmt2bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gcjsKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
