Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568860A261A
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ibj+ZERV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=df8KOkyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O4oVrQSYrJu8THTPG2Zdy7x+zkc/eARe/iLLI9HXLwo=; b=ibj+ZERVlXGqO1y2V9ZQOEXiV1
	etXonZE7Y/h6AA3YJzM+BpHslMEhMNmFmxRX4uL/OgmPpjBne2l19Piz5ZJmWEEp9Hw4Etb7CVrSp
	JUN92ZpnB7+qgEv6PP8C/rNACska2ZWUsAkO+S0S+UmW5S6oCfD1AGM9qnEoR0FVFHsDpqDU9XZh8
	uV6/yYEwz3AsofVDWtjOJ1X6EBCyAyPi1OFlpFCTadBmqBbkBViXMfHbbRHCnDEMEzaRE5J6xhvo9
	SM3yF4gHb1s93UIUYqANJZm+yUIp1HZlxzosDaeZJ1pJ3V6dTHvbIGbIa9SCPimE1gYv+C4wGdW1a
	ovipDU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjyE-0000000BhnE-3yNK;
	Fri, 13 Nov 2026 05:37:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjyA-0000000Bhku-1OoD
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 05:37:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso664893f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Nov 2026 21:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548220; cv=none;
        d=google.com; s=arc-20260327;
        b=PLl8kpnoG5gr5sg8X6kHfkNs7mzxlDMkbahZNIf+WiG/97eWkPp/gsFIdLykaiLFET
         U7O/chOsu2NdjYd9Eh0lAYA8tLfZgvae3iQgpEBIB72AMbWZtDpgdIoLtgSGzBdZHZ8p
         t7UPPuQpL49s8/2lCRjQgSowOtTcObWlhw8YGuwtWE1rkjsWRp3xjlpxMiWDrleMn1Zw
         Q3S3XIljqtmMXCQpwHhf/MSqydML70nOHXZB5/XKB36PmCJ6nTfsDaIA+p9PbFbD0XFU
         YYWkPP/gxgRVWOS9EtfZcLF6irhPCmPUBfrTkqjf9EASM86BBO/MzprK+QVJNiE+2vmq
         qjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        fh=GLNE5KU7BEHqTkFC6ZjKZ1MhQnuXsKiDJH0v2AO1SZs=;
        b=KDrGdtJzh1teK86f+JvmTFKw5YXU3KIKseuIv2OfwGnx+77ttrsEX9aud8D4w5ug1B
         Li0GCv+Q69b7Hkm4ZcH7oiKvaAZnAJEgZIQS47EDc7H6mcM398liK7vV9laCHkiOrujW
         YIbUoriLeRPpOsQW64PF6Jh/NlTp/HRljmuyuERFvpnCd0iob2WTwc0Uejw6eEsYyJsg
         oIj25bLize0FhM4P1AuCHneYYCfvU5ywwrIwOgJduuxRrJl8bm2nWK9Pxa5Ucc9FzlBW
         Ew4PjcrnAogVGtIYbo0wrbrExvqeQnJGpX4UVvuM5doNlpaX1Djqy2x7d2ZbhPl6YUlz
         NnwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548220; x=1795153020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=df8KOkyVb0gAspxQcIarFtqvtc/IxJyJfPVLGxHFI7ZVRqYnDzhJRI51M8Tlv7fzir
         QjHCgcbkqVsby72RVuzhanF0vHFf4qIq/NK4WdzWRU+T07QkzcrX0i/ejPsBQeiNJV6A
         oEMbVSHPTLQavNy4H5zzR6VeLGh1+S1sYVAp8OH08P5A9q117vJZ1Et7rd5H+osSsSz+
         p8hVPJ6aQtcHkQfkVpidHR8Se44Ja6rUwO4JL9VOQzBt933En2uuE6xLVGyImxEspsFL
         PmEdXD+VK0svzr2NaIOfPNS7zWSR1vgy//9fgX1egF/zYNVXZpJ1thicnBqDnmEG+Fug
         s/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548220; x=1795153020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=RUAvVH7ODUtkiszO/7p6csOPBQ+1kRwFRViMZBtdXfHJQD6vQZn4riKwLTW9s+Bdb1
         UCI/bG/nKPXUR/k7/S125Q39bVWEROhmihQe976R4jeyaICOqwqt5CD1JARAHxB5xbgo
         6WLD+4nVgI0rNi9iTmqsB8M6VP1nF1/tV124rKzSeLX++flkxwSTj742PVs2U61JMJr1
         LJqYlLdhdFpNb7tLJd8W0vCaSgKPq0IfPJs11SrVOVrqIKFW3HP9+P1R+T0tq0XO0bbB
         wK5ZHRvSP8v6N1J1mzON3zUMFVbTds99FBiliwt5gCMk+Bhr37ievfRyIZfGAch6eCzj
         1gHA==
X-Forwarded-Encrypted: i=1; AL+hErEXkTzvdb+vNO6KBWKT4L6Rlfcb1/Z/5qq2Wz8liu9EpZBf6tZrYbeqfBiqj3vpx+T/wPDEOS42j+c=@lists.infradead.org
X-Gm-Message-State: APuU4Z9J0bpMGHpNwlSkb9Zb5Mki5KB7iS9Sznj5YhCZVoRIXWMUoFmJ
	Ki81iI5zE2DpMJ8BUbruIK17NUxKicLikAJHFtAQP6ga6hA77n+K0+RKvdjHBSD5hIHEYmXPejp
	h4M2vIjJelblhvY5+vVf5fI/IFwUYSmH4MHRJTpH+Eg==
X-Gm-Gg: AYBFou2eAKa6CUgzX49jcc5txCr0e6AvcU5FHT1NxbTEA7hPTRF4NeqeBy+IKJM33Ma
	nBGDCi8YJ3mcITp985r63fmWMMb0QbsWjl9pm9ascKeNNkPMjcQcgaZ8tHFLkfLnHb/IsbMHl5V
	VcXiLgms3LfyHG3UoFlKgR2ZjyQPhqHQ4hwTVir0bbxNnQdwIhNycpDKnrfAEBVQ5UX4cpdANlS
	ufzO31coIl4z/Gs3uzF024hRzzxzA8LIPPa/n1JBn7spnrCukWavMDV6Z5x9abYwW65XTBKzscZ
	merhA08UwCDxV0gmsh55N8Q1pYVJZSYZXETHegzY72HZVeR0ClxQscK/B+uMrOuwt5d6MmbOXfm
	FRw4jWOhP59seNXf2WtYwKCdXgq2ATx0XXe0+VXBf1U0vx1Ncj00d/phayJMFJuVNgVf8L3Nacz
	by2jFvpSiZ9KVDD0TIUdTda4TEB+3tnuYH+NU8Lu2JBh90umc8oxK5Q5JHn3miOLKbVyYy7ix+x
	aGN4A==
X-Received: by 2002:a05:6000:4707:b0:48e:e98:8b6a with SMTP id
 ffacd0b85a97d-49c6d453ed9mr3163083f8f.4.1794548220458; Thu, 12 Nov 2026
 21:37:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1789872556.git.hppiscas@163.com> <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
In-Reply-To: <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:48 +0530
X-Gm-Features: AclHuK88LJjsYi40jv-VHQ1EhoNonVCEpnzC8CHgPBMpwYuzpNXU9bTUnQfxb6Y
Message-ID: <CAAhSdy2KAtv=4RAo8aaOjeHWga-JJsLympDWAeg6MjkfAxstoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <hppiscas@163.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213703_872115_A4962941 
X-CRM114-Status: GOOD (  16.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgNjo0MOKAr1BNIFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNA
MTYzLmNvbT4gd3JvdGU6Cj4KPiBLVk1fRU5BQkxFX0NBUChLVk1fQ0FQX1ZNX0dQQV9CSVRTKSBh
bGxvd3MgdXNlcnNwYWNlIHRvIHJlZHVjZSB0aGUKPiBzdGFnZS0yIEdQQSB3aWR0aCB3aGlsZSBh
IFZNIGhhcyBubyB2Q1BVcyBvciBtZW1vcnkgc2xvdHMuCj4KPiBBSUEgaW5pdGlhbGl6YXRpb24g
Y2FuIGNvbXBsZXRlIHdpdGggYW4gQVBMSUMgYW5kIG5vIHZDUFVzIG9yIG1lbW9yeQo+IHNsb3Rz
LiBUaGUgQVBMSUMgTU1JTyBkZXZpY2UgaGFzIHRoZW4gYmVlbiByZWdpc3RlcmVkLCBidXQgdGhl
IGV4aXN0aW5nCj4gY2hlY2tzIHN0aWxsIGFsbG93IHVzZXJzcGFjZSB0byBzaHJpbmsgdGhlIEdQ
QSB3aWR0aCBiZWxvdyBpdHMgYWRkcmVzcy4KPgo+IFJlamVjdCBHUEEtd2lkdGggY2hhbmdlcyBh
ZnRlciBBSUEgaW5pdGlhbGl6YXRpb24uIEJvdGggcGF0aHMgaG9sZAo+IGt2bS0+bG9jaywgc2Vy
aWFsaXppbmcgdGhlIHdpZHRoIGNoYW5nZSB3aXRoIEFJQSBpbml0aWFsaXphdGlvbi4KPgo+IFRo
ZSBpc3N1ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sLgo+Cj4gRml4ZXM6
IDcyNjNiNGZkYjBiMiAoIlJJU0MtVjogS1ZNOiBSZXVzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTIHRv
IHNlbGVjdCBIR0FUUC5NT0RFIikKPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiBBc3Npc3RlZC1ieTogZ3B0IDUKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVu
ZyBIb3UgPGhwcGlzY2FzQDE2My5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3Ig
TGludXgtNy40LXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzQ4NTJmM2I4OTg1YzM1MzgxMWZhMDY1ZTQ3MDFkNzZk
YzlhN2YwODYuMTc4NjUxMjY3MS5naXQucGVuZ3BlbmdAaXNjYXMuYWMuY24vCj4gLSBObyBjaGFu
Z2UgdG8gdGhlIGNvZGU7IHJldGFpbiBBbnVwJ3MgUmV2aWV3ZWQtYnkuCj4gLSBSZWJhc2UgYW5k
IGNsYXJpZnkgdGhlIGxvY2tpbmcgZGVzY3JpcHRpb24uCj4KPiAgYXJjaC9yaXNjdi9rdm0vdm0u
YyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0v
dm0uYwo+IGluZGV4IGE5ZjA4M2YuLjY2ZWRmYWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiBAQCAtMjUwLDcgKzI1MCw4IEBA
IGludCBrdm1fdm1faW9jdGxfZW5hYmxlX2NhcChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1f
ZW5hYmxlX2NhcCAqY2FwKQo+ICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZrdm0tPmxvY2sp
Owo+ICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+Cj4gLSAg
ICAgICAgICAgICAgIGlmIChrdm0tPmNyZWF0ZWRfdmNwdXMgfHwgIWt2bV9hcmVfYWxsX21lbXNs
b3RzX2VtcHR5KGt2bSkpCj4gKyAgICAgICAgICAgICAgIGlmIChrdm0tPmNyZWF0ZWRfdmNwdXMg
fHwgIWt2bV9hcmVfYWxsX21lbXNsb3RzX2VtcHR5KGt2bSkgfHwKPiArICAgICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9haWFfaW5pdGlhbGl6ZWQoa3ZtKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByID0gLUVCVVNZOwo+ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAg
ICAgICAgICAga3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSBuZXdfbGV2ZWxzOwo+CgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
