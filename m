Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFDFCD4F3C
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 May 2026 04:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mm59Em0vmBe6RA1azFBhpFSbvDVDlGoP0jKZFJcbAns=; b=BqYPZXGWfrg73J
	YGmGAzb/FyvqLgV08loOCR4/viOQqUM+OLEL6pHhHxOOoeiLDaocipHYzlsBmsAPjHTOWHE1BraHD
	tEDURC2Jl+XVetuGDpGkGyjFDaCk/30eIfGny54z/DgIx4NeUwu9v7w541hyOSIjkJz14Rpqk02RB
	PDDvZNWglO3fpUYsS+9mZaREAl036BeQ9rNgryZ4VT3M8wROENrljjoNs8jgHV1dkyFGaPNAaTXdr
	TLtOIpSqkt0n1AZGnHyw/bIB+m/NhAXL1Ye+sqzoyNBTzpVoruta39mtPdzYRaE9Qgr2YYC+nIpC3
	aRhVy7s78HAdQJVDjBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpdn-0000000EAQJ-2YQ5;
	Mon, 18 May 2026 04:31:43 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpdk-0000000EAPB-45yB
	for kvm-riscv@lists.infradead.org;
	Mon, 18 May 2026 04:31:42 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6948da50eb5so878848eaf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 17 May 2026 21:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779078700; cv=none;
        d=google.com; s=arc-20240605;
        b=MFEPUZccDFIoK6uoHrhhrg2/XVqTJmWDbS61XlANUtrGGULAB8s8Fa990P9gHb+u2i
         cwbkA+gVzw8TRcRVW1GGli3VwKeQy+RfcXdKshZHvLIJB0/8jsayH/MMBm6xQmYicCuw
         3F4suWR9F0Kl+4d83KrxIbLJFUflONlPIWLEQ2WE0fb47uJnktcXgAc7nIyQGYTA4o5K
         ihb4FyGDcP+BEkBdLA1M9uAiMVp4bnuv6U0pd+F8REAv6LHH6g1LdaaueSkyq9bGdX8f
         1gvb/1SwQWXoPC5XEo/jXJxuOTcUsLHg1knelXIN7TNZsbsDohhoBnLYlSrqGUQK6euO
         slLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        fh=rbuEIzsYIr6/Ci4u+weYs2vcyXyAM8lWXjs5fQIK+YQ=;
        b=E8NJcCjnivYbgwfT0mMYKYleE9FEitiT45qzQsJ9MCzV68XfjC4qNZVzoYYgSEUSKK
         EtL64Lk3xBKV1pOlWZRP7b1EyR7Wuce4CnRwc6+XMRXJj+nuLpfjFhuCkUVXsNdHHRe/
         trKXGHbJTk7NGnRQg24Alio40y40YrHPzNmlt8QSOV2k6RAUw7grfkdNJiZsUVt6Sn2K
         qfK/lbjBvYOwc+3zDMF6V2NRpyP+CEkpkWZw4VbnF8l6Ye+gQZqX7CVt9qeblfRrxY/v
         34mdZUrj00tC5zQ9Nx2iP+opWnc4HvK3IgxCHOXdAMM4CPJjVBHWCpxDlNB9KuQu7xLA
         GN9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779078700; x=1779683500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        b=cqaoxWIFcUgpG9qrWCP99UTAbBNSRRJGTbwz9X3aHG+BxJOwd1n6OpMRWwzyJ+cODP
         RenD0bj996DR0Y96NtdfkB4lBw8f3QxRqqev5fo3NG4vlWyib6MaSJKoSxTgBTg9yp9m
         DpNk130NRSuTdZAjvkh8aLw/mhOxm1+ZR0UubxOm2LHRbMHBTBnyZwl7DAGbF+MWb8rd
         Xvj11iJsC7MY8UtmQEqqCYKD3LOQ3DX2X5/Lf+Uguj3tcJxCPpW8latP3KISe/FEpbKi
         WiJv24XYITypLWM1UMMi7GFXqwIE0QgQEjvVeYOuhJ68Kiz+82lgNnZt3orkR2oKCgGr
         72wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078700; x=1779683500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        b=Y5rIlMI1V4uzZUit/WhNXKZ8ElHCBVMJZYsPllpIzthKxd9Psnyd2pR2PjB6IVDrt+
         ti48C4SmtoYjqcHnk8MwvEpttQ42uXxRyQKR6XEVTPRl1OXFQwn0BAqKKivkP1LH9L2S
         WzxId7zTL3qHaUqhAQyCJA5yGt08HnuLCjLrq9r6C6xxcr+YWAAo91cYnm20rq8NFF8c
         SFP8mENj2BCwxsv4EyRczow/s67qR0u3VOor+/uB/yiBugi+MSsuWl4tiSNrJJO14KIS
         gCKzSTqZUgIGIzrZbAnriiuONfXlXLrAM9O8QJ3UR1ThRokyapl7w/EpRGNL13DVcTd1
         1AWQ==
X-Gm-Message-State: AOJu0YzJTCR/Z7YqqyJppqwiv2YLxqJh9SshDlep09pRHKPzsuvyepE2
	NHsM9ZYvSEpvJiEoRRQxhkZvXGQerRX8hQo+rCGj3rkU3szPTL0Z7t7R9pFD2zZphUiCrmiCug4
	KkG4h75fYzZbzFP9emXlRg6keVlCF4Elcd/JFLTE4CA==
X-Gm-Gg: Acq92OHBYN/DLqdBS2oCsxbnmt7K4bLEWZoLOA8K+SHfizR4QS7GUkBj7F4OoJhmvER
	9xuup80kL1isKAK2FSY8blMqlk0YgK2VCxtFY0vnbp5V28JL2bMW1/iZ/F5d5AVi6Ke8KhMCxoW
	DnFodW4MR6Ep3pM/UN2xOQ2/QXdYzn9dNUGZtniT//FZpD1WxAxdDBszoOJnl+r+weNXqIcw4wJ
	ydjmlueJAryN31Qt8uXWpxo1Api5SWxaKJ7gVAt46xsLnGNGXXIKg/mgPY4kmDYMf9jh2fJ61Qh
	8dzAib1F9B0jcfhLCJmQYvFcuI3Mmig92oqNdGvpnMTYQWk2EGcPiKSB1CRcB9TfD6xF1oHoxap
	ek/OqTywAYOcUbAG0g5G8WnrHLQ==
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id
 006d021491bc7-69b884ac83amr8443261eaf.33.1779078699723; Sun, 17 May 2026
 21:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260514081752.472987-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260514081752.472987-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 10:01:28 +0530
X-Gm-Features: AVHnY4KrYwepB5OiXTY2dv7ZHi-ani2vKZrt4RfWbnSXlOx_ga651Ne910vtQ3U
Message-ID: <CAAhSdy2z_2OUyzA_MK+V6z_5ucwKN6A6f4j6hNaVH7c904SBQw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sign extension for MMIO loads
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_213141_273550_512F9933 
X-CRM114-Status: GOOD (  20.55  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTo0N+KAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBrdm1fcmlzY3ZfdmNwdV9tbWlvX3JldHVybigp
IGZ1bmN0aW9uIGhhbmRsZXMgTU1JTyByZWFkIHJlc3VsdHMKPiBieSB3cml0aW5nIHRoZSBkYXRh
IGJhY2sgdG8gdGhlIGd1ZXN0IHJlZ2lzdGVyLiBGb3Igc2lnbmVkIGxvYWQKPiBpbnN0cnVjdGlv
bnMgKExCLCBMSCwgTFcgb24gUlY2NCksIHRoZSB2YWx1ZSBuZWVkcyBzaWduLWV4dGVuc2lvbgo+
IGZyb20gYSBzbWFsbGVyIGludGVnZXIgdG8gdW5zaWduZWQgbG9uZy4KPgo+IFRoZSBjdXJyZW50
IGNvZGUgdXNlczoKPiAgICAgKHVsb25nKWRhdGEgPDwgc2hpZnQgPj4gc2hpZnQKPiBidXQgKHVs
b25nKSBtYWtlcyB0aGUgcmlnaHQgc2hpZnQgYSBsb2dpY2FsIHNoaWZ0ICh6ZXJvLWV4dGVuZCkK
PiByYXRoZXIgdGhhbiBhbiBhcml0aG1ldGljIHNoaWZ0IChzaWduLWV4dGVuZCksIGNhdXNpbmcg
aW5jb3JyZWN0Cj4gcmVzdWx0cyB3aGVuIHRoZSBNTUlPIGRldmljZSByZXR1cm5zIGEgbmVnYXRp
dmUgdmFsdWUuIEZvciBleGFtcGxlLAo+IExCIHJlYWRpbmcgMHg4MCB3b3VsZCByZXR1cm4gMTI4
IGluc3RlYWQgb2YgLTEyOC4KPgo+IEZpeCB0aGlzIGJ5IGNhc3RpbmcgdG8gKGxvbmcpIGFmdGVy
IHRoZSBsZWZ0IHNoaWZ0IHNvIHRoYXQgdGhlCj4gc3Vic2VxdWVudCByaWdodCBzaGlmdCBpcyBh
cml0aG1ldGljIGFuZCBjb3JyZWN0bHkgcHJvcGFnYXRlcwo+IHRoZSBzaWduIGJpdDoKPiAgICAg
KGxvbmcpKCh1bG9uZylkYXRhIDw8IHNoaWZ0KSA+PiBzaGlmdAo+Cj4gQWRkaXRpb25hbGx5LCBy
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHNoaWZ0IGFzc2lnbm1lbnQgZm9yIExCVQo+ICh1bnNpZ25l
ZCBieXRlIGxvYWQpIHNpbmNlIGl0IGRvZXMgbm90IG5lZWQgc2lnbiBleHRlbnNpb24uCj4gVGhp
cyBtYWtlcyBMQlUgY29uc2lzdGVudCB3aXRoIExIVSBhbmQgTFdVIHdoaWNoIGFscmVhZHkga2Vl
cAo+IHNoaWZ0ID0gMC4KPgo+IEZpeGVzOiBiOTFmMGU0Y2I4YTMgKCJSSVNDLVY6IEtWTTogRmFj
dG9yLW91dCBpbnN0cnVjdGlvbiBlbXVsYXRpb24gaW50byBzZXBhcmF0ZSBzb3VyY2VzIikKPiBT
aWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gQXNzaXN0ZWQt
Ynk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeCBmb3IgTGlu
dXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2lu
c24uYyB8IDkgKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGluZGV4IDRkODliOTQxMjhhZWEuLmYwOWY5
MjUxZDFmMGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IEBAIC00MTUsNyArNDE1LDYgQEAgaW50IGt2
bV9yaXNjdl92Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHNoaWZ0ID0gOCAqIChzaXplb2YodWxvbmcpIC0g
bGVuKTsKPiAgICAgICAgIH0gZWxzZSBpZiAoKGluc24gJiBJTlNOX01BU0tfTEJVKSA9PSBJTlNO
X01BVENIX0xCVSkgewo+ICAgICAgICAgICAgICAgICBsZW4gPSAxOwo+IC0gICAgICAgICAgICAg
ICBzaGlmdCA9IDggKiAoc2l6ZW9mKHVsb25nKSAtIGxlbik7Cj4gICNpZmRlZiBDT05GSUdfNjRC
SVQKPiAgICAgICAgIH0gZWxzZSBpZiAoKGluc24gJiBJTlNOX01BU0tfTEQpID09IElOU05fTUFU
Q0hfTEQpIHsKPiAgICAgICAgICAgICAgICAgbGVuID0gODsKPiBAQCAtNjQ5LDIyICs2NDgsMjIg
QEAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fcmV0dXJuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9ydW4gKnJ1bikKPiAgICAgICAgIGNhc2UgMToKPiAgICAgICAgICAgICAgICAg
ZGF0YTggPSAqKCh1OCAqKXJ1bi0+bW1pby5kYXRhKTsKPiAgICAgICAgICAgICAgICAgU0VUX1JE
KGluc24sICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgKHVsb25nKWRhdGE4IDw8IHNoaWZ0ID4+IHNoaWZ0KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAobG9uZykoKHVsb25nKWRhdGE4IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSAyOgo+ICAgICAgICAgICAgICAgICBkYXRhMTYg
PSAqKCh1MTYgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNu
LCAmdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1
bG9uZylkYXRhMTYgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IChsb25nKSgodWxvbmcpZGF0YTE2IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSA0Ogo+ICAgICAgICAgICAgICAgICBkYXRhMzIgPSAq
KCh1MzIgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNuLCAm
dmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1bG9u
ZylkYXRhMzIgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIChs
b25nKSgodWxvbmcpZGF0YTMyIDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgY2FzZSA4Ogo+ICAgICAgICAgICAgICAgICBkYXRhNjQgPSAqKCh1
NjQgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNuLCAmdmNw
dS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1bG9uZylk
YXRhNjQgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIChsb25n
KSgodWxvbmcpZGF0YTY0IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
