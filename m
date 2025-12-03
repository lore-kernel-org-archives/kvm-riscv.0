Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09A9D1266D
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 06:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0aEd5GBqF76hL8YrvFNGYMyk2CV/bNgEFsNI5xgskU=; b=h9XJ/Sygafsf1c
	KxYkwFeacaQ/VTeybg+OiPuN03nytXjJh2cNGfCUUNacVg7Pi9frKmX7rPBGhMZB7k3FpUzNCY0a2
	GndOZ+rVj3vE4+erlMMO/ckFVitUUXRfJr2XpdHktDdtUg8kTATruWXQSoK1ToXuXRJkZ3HfrT4bR
	zyZ++vDzDXKiC7kU9NOIE44Cs7sCaSVUHC6h8hdEocwvQ1w+sK5pxc/0BNTn+bHR0lgEIzl7/qkEn
	D74YVzBq+1SfryRVGTAPc97zY++VYMYjn5W37Rl+Cmk7bQzkCraqDnlkD3h45hR1A2LWaWVTL8CzB
	mG/q7c0/bmTE1EV9VwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQg38-00000006AUg-0uhI;
	Wed, 03 Dec 2025 06:09:14 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQg34-00000006ATA-1f4A
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 06:09:12 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3e83c40e9dfso1401401fac.1
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Dec 2025 22:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764742149; x=1765346949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYSjCRC/hHI1H3gb+cN7itSUSjyZ/eJu080H8ZPljqA=;
        b=lxX5K0CiIUEFWhiLdCIV2R+AI/Fwh3DRLwSBIcaQuU81B+giY6AyXJhoxvk8Mc8ChP
         vYUiagy2QXEZWW+H62y6Y1dusNyaDM4ji5GFjtma3/7aMsmdqiv+ksQHGqcMVXNrz8bY
         HWXs0/QXfGmxP6NRbjWewcEJbu5M6Hp5UEHox6x//+Oal+WM8uV0ISpHfobi9q9FTbvL
         cqAeofvRED6vjffpIFgADW7+64h3gmodMIVbpm+EwodtVTUakP2HqSIV4c0SHJkTGgxg
         GsfmFErIzX1psUeHGpP9dmTjB8f8yrx8mYNqMFL04TSF5jdZkkDvd9a2VkqnstWnfe7D
         BCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764742149; x=1765346949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYSjCRC/hHI1H3gb+cN7itSUSjyZ/eJu080H8ZPljqA=;
        b=p69Go05MwvRMbRU4L6wZZpCSfmmuSSyHpf/iWA+fmQNFiQY9PT2xXSy8sQhMpDuNUI
         e/fWfVdU3Spt7Nj0XUL8IPOeDGeLdRcqF75ZEp7+qHvLQMV/Z0GV1VCU3Ys6u23MEVWf
         UytV6VFWUchURfZDuUdagCLeRiAdhHWuHlAS1NwZ1iOoziA6nvSZinbQd6mJOP4jMKWZ
         fdDLB2CRKi32QZrp7DrUqQWAAtyxV5zxlypc1iiLHrpmENVreJqWfvZscfz9L/aBr/Vv
         CPec5jQ/CePQO1XH7o58Dgjde/Dujw04a4VziBeeRacDFiLQr9LwT+AJNjHoJst8XizD
         L2KA==
X-Forwarded-Encrypted: i=1; AJvYcCVuq2mqbqYxsojGUp/0UVL78spCt6/75ISUGG/BvOm3uUHvNHwfwLl4R5X2ufyJ317R9RSvr9psmpY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzflLb+jGwNzx2Aux5Q4P2s8gMvtbpMfUrooBdb0SbswUTh554Y
	XopfTdJ2YVownoiw+un9P8PJkfW6FoFV8fZMNHHKjXRFO2mouL8EOmSB34ibLpxeZkmi7QuxEJw
	kfZCnKYfnlM3AZJHHRP6Z+C+Uc7AHra0nHL04BJ+kNg==
X-Gm-Gg: ASbGncuvoY+Ka5ZDLVNDh/6CMKpZHyYMOkEzqjNE19vp5JL7CyO8TYb9iTxyAx7/So6
	cm0KU0Fjeee6tfx72CebOVjwJOp7/3DlCi1RDvRIG6WwksrUv+R7lUJR4191UGYmOY/g5TbHK9s
	fBvtmNeimGG1ZBgwI66MU2JHWRgznTm9dlQs6OurvIxW5PM62j5GvVnSFJT8siroCUwpthdbie/
	P6XmicwRDYGApFyyxjdoSRN8Q0xMFpM8zmzwj+0BBhSil6zqoQjZP9cNj0s8BvZ787wkA==
X-Google-Smtp-Source: AGHT+IEcOy75SVKzhqsvQgDX25DVxTD0tJpPOKTQLPBYv2km9cUYBIeJ/z3VSk/G5Ocsrz0txeVer6yWZkrnr5El9wQ=
X-Received: by 2002:a05:6808:c3eb:b0:44d:a4d3:b6a6 with SMTP id
 5614622812f47-4536e4f2683mr653938b6e.35.1764742148683; Tue, 02 Dec 2025
 22:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20251124-4ecf1b6b91b8f0688b762698@orel> <20251125141811.39964-1-fangyu.yu@linux.alibaba.com>
 <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com> <CAJF2gTTYwsG4Q6n3JWi8S4brOA_mh7OdpquMU-eJYAEHwDeSdw@mail.gmail.com>
In-Reply-To: <CAJF2gTTYwsG4Q6n3JWi8S4brOA_mh7OdpquMU-eJYAEHwDeSdw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Dec 2025 11:38:57 +0530
X-Gm-Features: AWmQ_bkb6N-7dICbNGOMVSKlH7NSygl6xNkVh8uyiwaa2kv1hzcn9J09Zs9Fkdk
Message-ID: <CAAhSdy0SU86SeAN+NHoYKUubfG8Z3nonge86kzvfdupWWc4-qA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
To: Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	fangyu.yu@linux.alibaba.com, ajones@ventanamicro.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_220910_523034_C705C9A1 
X-CRM114-Status: GOOD (  22.96  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgNzowOeKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+Cj4KPiBPbiBXZWQsIE5vdiAyNiwgMjAyNSBhdCAyOjE24oCvQU0gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiAyMDI1
LTExLTI1VDIyOjE4OjExKzA4OjAwLCA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPjoKPj4g
Pj4+IE9uIFNhdCwgTm92IDIyLCAyMDI1IGF0IDM6NTDigK9QTSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPj4gPj4+ID4KPj4gPj4+ID4gRnJvbTogRmFuZ3l1IFl1IDxmYW5n
eXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+ID4+PiA+Cj4+ID4+PiA+IEN1cnJlbnRseSwgSEdB
VFAgbW9kZSB1c2VzIHRoZSBtYXhpbXVtIHZhbHVlIGRldGVjdGVkIGJ5IHRoZSBoYXJkd2FyZQo+
PiA+Pj4gPiBidXQgb2Z0ZW4gc3VjaCBhIHdpZGUgR1BBIGlzIHVubmVjZXNzYXJ5LCBqdXN0IGFz
IGEgaG9zdCBzb21ldGltZXMKPj4gPj4+ID4gZG9lc24ndCBuZWVkIHN2NTcuCj4+ID4+PiA+IEl0
J3MgbGlrZWx5IHRoYXQgbm8gYWRkaXRpb25hbCBwYXJhbWV0ZXJzIChsaWtlIG5vNWx2bCBhbmQg
bm80bHZsKSBhcmUKPj4gPj4+ID4gbmVlZGVkLCBhbGlnbmluZyBIR0FUUCBtb2RlIHRvIFNBVFAg
bW9kZSBzaG91bGQgbWVldCB0aGUgcmVxdWlyZW1lbnRzCj4+ID4+PiA+IG9mIG1vc3Qgc2NlbmFy
aW9zLgo+PiA+Pj4gWWVzLCBubzUvNGx2bCBpcyBub3QgY2xlYXIgYWJvdXQgc2F0cCBvciBoZ2F0
cC4gU28sIGNvdmVyaW5nIEhHUEFUUCBpcwo+PiA+Pj4gcmVhc29uYWJsZS4KPj4gPj4KPj4gPj5U
aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgaW1wcm92ZWQsIGJ1dCBJIGRvbid0IHRoaW5rIHdl
IHdhbnQgdG8gc3RhdGUKPj4gPj50aGF0IHRoZXNlIHBhcmFtZXRlcnMgYXBwbHkgdG8gYm90aCBz
LSBhbmQgZy1zdGFnZS4gSWYgd2UgbmVlZCBwYXJhbWV0ZXJzCj4+ID4+dG8gZGljdGF0ZSBLVk0g
YmVoYXZpb3IgKGctc3RhZ2UgbWFuYWdlbWVudCksIHRoZW4gd2Ugc2hvdWxkIGFkZCBLVk0KPj4g
Pj5tb2R1bGUgcGFyYW1ldGVycy4KPj4gPgo+PiA+IFJpZ2h0LCBhZGRpbmcgbmV3IHBhcmFtZXRl
cnMgZm9yIGctc3RhZ2UgbWFuYWdlbWVudCBpcyBjbGVhci4KPj4gPgo+PiA+IE9yIHdlIGNvdWxk
IGRpc2N1c3MgdGhpcyB0b3BpYywgZnJvbSBhIHZpcnR1YWwgbWFjaGluZSBwZXJzcGVjdGl2ZSwK
Pj4gPiBpdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSB0byBwcm92aWRlIGFsbCBoYXJkd2FyZSBjb25m
aWd1cmF0aW9uCj4+ID4gY29tYmluYXRpb25zLiBGb3IgZXhhbXBsZSwgd2hlbiBTQVRQIGlzIGNv
bmZpZ3VyZWQgYXMgc3Y0OCwKPj4gPiBjb25maWd1cmluZyBIR0FUUCBhcyBzdjU3KjQgaXMgbm90
IHZlcnkgbWVhbmluZ2Z1bCwgQmVjYXVzZSB0aGUKPj4gPiBWTSBjYW5ub3QgYWN0dWFsbHkgdXNl
IG1vcmUgdGhhbiA0OCBiaXRzIG9mIEdQQSByYW5nZS4KPj4KPj4gVGhlIGNob2ljZSBvZiBoZ2F0
cCBtb2RlIGRlcGVuZHMgb24gaG93IHVzZXJzIGNvbmZpZ3VyZSBndWVzdCdzIG1lbW9yeQo+PiBt
YXAsIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBzYXRwIG9yIHZzYXRwIG1vZGVzIGFyZS4KPj4gKEFsbCBS
VjY0IFN2WFkgbW9kZXMgbWFwIFhZIGJpdCBWQSB0byA1NiBiaXQgUEEuKQo+Pgo+PiBJZiB0aGUg
bWFjaGluZSBtb2RlbCBtYXBzIG1lbW9yeSB3aXRoIHNldCBiaXQgNTUsIHRoZW4gS1ZNIG5lZWRz
IHRvCj4+IGNvbmZpZ3VyZSBTdjU3eDQsIGFuZCBpZiBub3RoaW5nIGlzIG1hcHBlZCBhYm92ZSAy
IFRpQiwgdGhlbiBLVk0gaXMKPj4gY29tcGxldGVseSBmaW5lIHdpdGggU3YzOXg0Lgo+Pgo+PiBB
IG1vZHVsZSBwYXJhbWV0ZXIgd29ya3MsIGJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2VyIHRv
IHNldCB0aGUgaGdhdHAKPj4gbW9kZSBwZXItVk0sIGJlY2F1c2UgbW9zdCBWTXMgY291bGQgdXNl
IHRoZSBlZmZpY2llbnQgU3YzOXg0LCB3aGlsZSBpdCdzCj4+IG5vdCBhIGdvb2QgaWRlYSB0byBw
aWNrIGl0IGFzIHRoZSBkZWZhdWx0Lgo+PiBJIHRoaW5rIEtWTSBoYXMgZW5vdWdoIGluZm9ybWF0
aW9uIHRvIGRvIGl0IGF1dG9tYXRpY2FsbHkgKGFuZCB3aXRob3V0Cj4+IHRvbyBtdWNoIGNvbXBs
ZXhpdHkpIGJ5IHN0YXJ0aW5nIHdpdGggU3YzOXg0LCBhbmQgZXhwYW5kaW5nIGFzIG5lZWRlZC4K
Pgo+IEdvb2QgcG9pbnQ7IGlmIG9ubHkgYSAxMjhHQiBHUEEgbWVtb3J5IHJlZ2lvbiBpcyBuZWVk
ZWQsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIFN2NTd4NCwgd2hpY2ggY29zdHMgUFRXIGN5Y2xlcy4K
Pgo+IFNvLCB0aGUgZGV0ZWN0aW9uIHNob3VsZCBzdGFydCBmcm9tIFN2Mzl4NCB0byBTdjU3eDQg
d2l0aCB0aGUgZ3Vlc3QgbWVtb3J5IHNpemUuCj4KCk5BQ0sgdG8gdGhlIGFwcHJvYWNoIG9mIGRl
dGVjdGluZyBiYWNrd2FyZHMuCgpIR0FUUCBtb2RlIGlzIGEgcGVyLVZNIGF0dHJpYnV0ZSBoZW5j
ZSBpdCBtYWtlcyBzZW5zZQp0byBkZWZpbmUgYSBWTS1sZXZlbCBLVk1fQ0FQX1JJU0NfeHl6IGZv
ciB0aGlzIHB1cnBvc2UuClRoZSBkZWZhdWx0IGJlaGF2aW91ciBzaG91bGQgYmUgdXNlIGhpZ2hl
c3QgSEdBVFAgbW9kZQp1bmxlc3MgS1ZNIHVzZXItc3BhY2UgY2hhbmdlcyB0aGUgS1ZNX0NBUF9S
SVNDX3h5egpzZXR0aW5nLgoKLS0tCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
