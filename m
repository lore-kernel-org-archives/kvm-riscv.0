Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372F2CD4F39
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AubaNXOZtOGAI3b537IAJnWh4X16ho7fP2VXdrmFnbY=; b=fgflS5f6I/riXE
	WSx2jnRSsfOYk/Yd/StUd06pIGGDGvYw7gQllwU2zEpTG/NEeoBRB/l5k32a8u9oFG/heIElI7yTI
	T5FSFV/2UDEN0p73BCS4vV1QgG1Uv4jTAtXFt5HoO65NYLkwU6fIHl+lMBvMOZ5Ac+Zsq96Jj0KOp
	vGSAv0mu2voPsfpJo0EveHkDCDwBCPN9dsAfxunVxUr40VCkSoOUVWctTsEHjVtZKCHW4kTVyH23d
	0I62sbcpmhO/AVwwX2oJi1ojPs6VcOWaks+fsNu7+0tq/XP5MFR609ST/fzuj3rc2X+HQ2+mgf+Ec
	rFKCYZD+KmgU3E7kJ9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVvF-00000005ZRM-2K8k;
	Thu, 14 May 2026 13:16:17 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVvA-00000005ZQ8-3iA9
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:16:14 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7dca5f64e86so6253034a34.0
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 06:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778764571; cv=none;
        d=google.com; s=arc-20240605;
        b=ElxcEHb/nRa4EZagpFCEHXU80dF/hfUBEh91FgbKTDlQAl6G0cFUPIrZVJLWmbxzZ1
         NsynjEDZUrPkTDN+3fyzGsg1FdP6yHo/tNthEbLq5Y0Sr99FPyoWjZ0NJWYHKBv766Ow
         +D5uzWV3EQ/p9Zc1C1Tt+I4pE28Ua1WSDQJHp2a0rc+lrBsuiRsEv2aZkENnoe3FndSd
         Uydo3exKcmDISxF2365xIVG+OOI5ARZvASqhyPhLO6T/2WjF1uYL6uxeNK8lAFSIT2FV
         miStpNpuv6MqgDAeoUEeus7cNNdTrxpmnCo2KwSaxqd0qPm8Wh/DLCc40tHNQ1nk7GH0
         xmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        fh=5yFDzCglPsfifI29q0AjrjYFefAp51CEBaTQLTxrFds=;
        b=O60COAzY0mhtBL6ND7Tc80jMQqOzdaKxhjzZI7M8YlVqKGg0u1+N5jk7tJnq5jfio1
         YyUpuymdWXqI+UqLT9IMMgw0iPuEWhVWLEhxqvQBhE3wfAPbxQh/jJOYqssh+MRWINDh
         Tupl4VEa1t9id9rfrbtBgpLfdn88rIXE3ApcvLHwaeUPEaoqcGtWwXIolWeWTZ5ofz/1
         CwQ8I/R6q7fQoFD34vFrHFSfyQ+cbP1SKpqbvEkUd8GNylKXoE6voZPgsqvjIJ/+Snx8
         aswy4bcGl3vhLFPaG8Rn5g164OpAYbyFBXZNT04o6WYUKi0Tex9p+l6EAduB/tA1y+r2
         BC8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778764571; x=1779369371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        b=gs7NVkM5stjI65OqgUlh/E8gfRG1H15wk8VOaSKpPvphBYZXE2RFLjHIhhHXwFKoS6
         2/NeYfvlSpdG2dDbUqoOulBj7YM3mpYyOp+iL2avB+Fqfw3aHBDgnt9+YB4roUtyM60V
         XktBlEBvs7mPzI3Fn/sI8AtUl+SVqFII/g0EbtI6oqLARkIcAkJt2wEf4RHl78mhesmP
         v0uQRTxDyLEUIEdIGR7OQlQbALPs+13411VuwkEhOJQZ88bLMzycwoQoyJd/ubCfFQuJ
         wYjcykFNxoaWmNKAR4cCOBu2AGDQxhCb94KYk1gRVTQdm1LoJlDcmdz40kctvdErsV3G
         zQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764571; x=1779369371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        b=Ajf8UWDM0wDOpwW+rTf2HgcdIfxA/6e0IXhTEtf4/4OMx5XCTVR6Mr606t0SWFL6c6
         Jci2g4i21pSW3vB3uWIFJATOmVbv+RU8XXHeysEpNtKLjK+A5RCh4vxxIBVMpHwCaN+8
         K0Q9yFC4DuE+seh4ByVDQfJVJMKVl4LzxFZzyhrEYQ7KABb7pP3cvIYzhnpDDQ43K3CA
         xv6sfHWTSEe6TWvisRnWAUTx7yYf4TSyX9xcZ5nLJBo8zsRA5cBQo1Hm4hnu2fOCki5T
         XVEwyumv6TiZJQYh8ej7jAswpLep59XsD0YHhjdTWKPu1L8JMAIHC0rn/SASq+BGWhsJ
         1RVw==
X-Gm-Message-State: AOJu0YxNK4DUuBvpKE9GUOtLVaqB126VQxGXXUJhyDPJ2cZJBey8xfA+
	mnJa2AoI/ccifiIe+Ux7PGNFflQdkk7t0i+jkaqu1Ew3pf29S6FeXSUyuEjl4FsoIXnxZDO6tB7
	R7IpcjJ5BRrQBdnOjaxORSFkbH2QEjFeRobVXtkxq4Q==
X-Gm-Gg: Acq92OGTlFMm9/e83qu5SujqrWcpdkR83vYLv/sfu0DJyT4mJpLuuSWARWZs3E7QH9v
	MwFYG3WJfvCB7L/wL7HkGSqi3rzb6f9ru65AjquZsKPI1QRrcB5jtUeVyKq6aGV0CpWU1MPK0O8
	mHZ7JOecCET9RKwDPWSM93xxReOyKGjvm6cle4eYU6+Q225HuROk7FHvdn9H2SAiHsmoBxukDQF
	3+wLYgPvryNHHamru/w8zS7PWjb8TvdBC0GT06bbIOBL5RDyzPs+QrJOQqDayr6prijvN93V0L1
	Shugef1QubYci4MtrIEWcfZaFzF+gPepZfyhx96ErunaAiUnZ5yr6OCQLlljw3b5nVYbdRk2iNn
	9DfSY2hIcBqXCBMqoHyNpRjuepE0=
X-Received: by 2002:a05:6830:6209:b0:7e1:e832:c8a2 with SMTP id
 46e09a7af769-7e3dc905429mr4793888a34.19.1778764571356; Thu, 14 May 2026
 06:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 18:45:58 +0530
X-Gm-Features: AVHnY4JeoNYVJt-e7SmR0Mdkf1NGWqjoq_KVrwu0L02Ywar886al5DcZ-0R7w5o
Message-ID: <CAAhSdy0CSbsmdjCu36F-8-CD4A2Sfz4Q4OYa3i=9o1MJeVT8=w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix invalid HVA warning in steal-time recording
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061613_028480_7BEC4071 
X-CRM114-Status: GOOD (  23.50  )
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

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMToyMuKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1l
KCkgYXNzdW1lcyB0aGF0IHRoZSBzdGVhbC10aW1lIHNoYXJlZAo+IG1lbW9yeSBHUEEgKHZjcHUt
PmFyY2guc3RhLnNobWVtKSBpcyBhbHdheXMgYmFja2VkIGJ5IGEgdmFsaWQgZ3Vlc3QKPiBtZW1v
cnkgc2xvdC4gSG93ZXZlciwgdGhpcyBhc3N1bXB0aW9uIGlzIG5vdCBndWFyYW50ZWVkIGJ5IHRo
ZSBLVk0KPiB1c2Vyc3BhY2UgQUJJLgo+Cj4gQSBtYWxpY2lvdXMgb3IgYnVnZ3kgdXNlcnNwYWNl
IGNhbiBzZXQgdGhlIFNUQSBzaGFyZWQgbWVtb3J5IEdQQSB2aWEKPiBLVk1fU0VUX09ORV9SRUcg
d2l0aG91dCBlc3RhYmxpc2hpbmcgYSBjb3JyZXNwb25kaW5nIG1lbW9yeSByZWdpb24gdmlhCj4g
S1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04uIEluIHN1Y2ggY2FzZXMsIHRoZSBHUEEgY2Fubm90
IGJlIHRyYW5zbGF0ZWQKPiB0byBhIHZhbGlkIEhWQSBhbmQga3ZtX3ZjcHVfZ2ZuX3RvX2h2YSgp
IHJldHVybnMgYW4gZXJyb3IgYWRkcmVzcy4KPgo+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IGluY29ycmVjdGx5IHRyZWF0cyB0aGlzIGFzIGEga2VybmVsIHdhcm5pbmcKPiB1c2luZyBXQVJO
X09OKCksIHdoaWNoIG1heSBlc2NhbGF0ZSB0byBhIGtlcm5lbCBwYW5pYyB3aGVuIHBhbmljX29u
X3dhcm4KPiBpcyBlbmFibGVkLgo+Cj4gVGhpcyBpcyBub3QgYSBrZXJuZWwgYnVnIGNvbmRpdGlv
biBidXQgYSBub3JtYWwgaW52YWxpZCBjb25maWd1cmF0aW9uCj4gZnJvbSB1c2Vyc3BhY2UsIGFu
ZCBzaG91bGQgYmUgaGFuZGxlZCBncmFjZWZ1bGx5Lgo+Cj4gRml4IGl0IGJ5IHJlbW92aW5nIFdB
Uk5fT04oKSBhbmQgdHJlYXRpbmcgaW52YWxpZCBIVkEgYXMgYSBub3JtYWwKPiBmYWlsdXJlIGNh
c2UsIHJlc2V0dGluZyB0aGUgU1RBIHNoYXJlZCBtZW1vcnkgc3RhdGUuCj4KPiBGaXhlczogZTlm
MTJiNWZmZjhhZDAgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNCSSBTVEEgZXh0ZW5zaW9uIikK
PiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4KPiBT
aWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gQXNzaXN0
ZWQtYnk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKClF1ZXVlZCB0aGlzIGFzIGZpeCBmb3IgTGlu
dXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zdGEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IGluZGV4IDNiODM0NzA5YjQyOWYuLjYwZTUw
Mjk2YTAwODUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IEBAIC00Niw3ICs0Niw3IEBAIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+ICAgICAgICAgZ2ZuID0gc2htZW0gPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIGh2YSA9IGt2
bV92Y3B1X2dmbl90b19odmEodmNwdSwgZ2ZuKTsKPgo+IC0gICAgICAgaWYgKFdBUk5fT04oa3Zt
X2lzX2Vycm9yX2h2YShodmEpKSkgewo+ICsgICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEoaHZh
KSkgewo+ICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSA9IElOVkFMSURfR1BB
Owo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM0LjEKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
