Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D641C982CC
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sJcd+JkX3lqTCODKNVB01S5mhk8I2x1gUdKlMTGqOI=; b=FDiG2Ms2b24XqR
	CyvIzPQetx6vyBfTYIoHhql7OUAHe/SH4UocXf4FBd7sm8wS7Z7nCoXe+lmO43ydE4yZDWHocqhhA
	KxhM3+AUDD4kLeKuL9Xf0rhJnoXXfLSmjri1adsGDmzNXMkWBgbcd1oQSTG61JBCSAygH5yeIMw22
	Y5+/hwiauwjoGIU/kqCccz+komy5QNaWUECw0J0ssO4IbPCpooLyPXwXIO9ecnp8Fk/JER0yHlfdN
	wE3QGSDFhJ/3qT7x044Ti2fCS3e9no2X3UkNua5WeYqjDGRShaQyvBK9CjAKEPx0I3tnWiQhBtqLz
	Gx5Tzd8e0PmdpFi5xaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89kp-0000000GvGV-0bHL;
	Sun, 20 Sep 2026 05:06:19 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89kk-0000000GvFl-1w7I
	for kvm-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 05:06:17 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-38de693676dso1475901a91.0
        for <kvm-riscv@lists.infradead.org>; Sat, 19 Sep 2026 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880773; x=1790485573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=OQMW6mrse0FKsx4lzlBce5+QCH8AFnzpLgu8B73OvSZV50DwXBsagHxjzrVXZAVYmQ
         NuwLHWarHEkWTgfSCXtu0Cm7Kx7qJczcb2mO/Ewev5J+5CWeGUxUrwXaqQQazcPS7uaR
         s3uo1X6I6xeV2ol1bDtfXkuRbpa20qpi0YjcFS0FpRwNX64dEhGIgHUzJ8E841pZphDW
         TDySH+xQ3YLrlr9iAsypUFxiUM5CdRo7+TUiM+ghfcTzarNURJZR80yVnaZ4NSy+KVSr
         Q3OCLcFm0J/LDkBKYYRmktGw2/O81L3azaOOEVP9teKoJviuCMYJGFXqDkiflDHlaRuU
         V27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880773; x=1790485573;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=RM8N3D8l7tJRt172M1iqtn/acV5dyKsi7UH7uAZy/8bdlKGwQEz+RF2KBEmni0CZkg
         z6uatnAdUGx4IGqswjA0NMLjxyRyQiBuBnbHtv2WiCpW5Q825PNVDpgNrdZ5GWJX9u5U
         6pRp5xTi2Fh6CvhWAFo78ZOqOG4tZnVTqlaqB8dxEHPy4prm4z7D2bwPIqP/m6kRBw+c
         qbaZtYb1BUlUoq24QiLApqYt94q64l9E1/X6AwKfBN9mezQzW08Y1pDswDYVk9VBX8NJ
         PQYoeWhUTVrZ1gjRn3rW3M36dFcd65683w2HNhIeq5JcijM0R8xq+FsEsV6XgnQkzhUF
         lQMw==
X-Forwarded-Encrypted: i=1; AKwUvBxVxRPGZ4x8iLQxotzzwkEPhLZW+OFVg9G1YV5TCUHfaOxl0QglIA71HMK4XPWj0oqpbbpIeQw9wps=@lists.infradead.org
X-Gm-Message-State: AFuF++mNDxnoJpyw+gj/3ti0jqsGx7Ei3iirJdoUP5eHI6CbjqXiqGD9
	TXTiMatRGrFei7+ePY3UTjQzmfx/4XyFP2RBeQpbSIfwCHX7Z3fi57i6
X-Gm-Gg: AYBFou3+iY2hpWEdXltvi6Zv2lGigFgujmqNelyT2yNA6K13+mi9IWIvxGKwvgdZIso
	iFaYd0d9TLOvF0pGDAhZJ/pUVZCsFRRffMKXCNtfjmlgXrsabSnh4ky9/z0qdK8kdL8QHE3xsAi
	sVm9aUkCnv/7U6/0BaiU8/Ga11DQQxgV9lfqLMnxd1IFxPlT5cUkA4POUCH1ENRfnRG+T1f4lmh
	FDC8q/3lCnOV136DUNNlKixsUmPf4F8EOrpV3i82NPCfJ6576IbreryCpmzSbm4cTBkKWAcseSf
	6iLvuPlRbGpyPQx1qTgS4pLd+Ten3p1nkzaXtZiHGFfzBzV7aVE/w/BITwJ75k6aS4u+YVpYDF6
	qM4psqmRAD9I7HIoN0QNpOUupb7HWlanM99YabhKqkKhyw1nWMPdzgaNRNPx44ZxIjzLGhZK6bV
	OVnYk522t3eVwbInhoqOK42Rc0E9jzEtjgP9mR3jGw/LGl9s7QbHuXt6r/jIk5wsI+PTQA3aO6o
	yygoTTruCkOmbsf
X-Received: by 2002:a17:90b:3eca:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-39e6a7f2209mr6292197a91.34.1789880772639;
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Received: from [192.168.50.174] ([124.64.19.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm7433814a91.4.2026.09.19.22.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Message-ID: <8572d404-8a33-4cd3-a14f-ebff7c2ac487@gmail.com>
Date: Sun, 20 Sep 2026 13:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
 jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
 jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 skhawaja@google.com, tomasz.jeznach@linux.dev, vasant.hegde@amd.com,
 will@kernel.org, zong.li@sifive.com
References: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
 <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_220614_509284_A1813A6E 
X-CRM114-Status: GOOD (  27.21  )
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

SGkgRmFuZ3l1LAoKT24gOS8yMC8yMDI2IDExOjEyIEFNLCBmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20gd3JvdGU6Cj4+SGkgRmFuZ3l1LAo+Pgo+Pk9uIDkvMTUvMjAyNiAxMToyOCBBTSwgZmFu
Z3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5n
eXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Pgo+Pj4gUHJlLWVuYWJsZSBSSVNDVl9JT01NVV9E
Q19UQ19HQURFIGluIHRoZSBkZXZpY2UgY29udGV4dCB3aGVuCj4+PiBhdHRhY2hpbmcgYSBzZWNv
bmQtc3RhZ2UgZG9tYWluLCBpZiB0aGUgSU9NTVUgc3VwcG9ydHMgQU1PX0hXQUQuCj4+Pgo+Pj4g
U29mdHdhcmUgcHJlLXBvcHVsYXRlcyBzZWNvbmQtc3RhZ2UgcGFnZSB0YWJsZXMgd2l0aCBEIHNl
dCwgc28KPj4+IGVuYWJsaW5nIEdBREUgYnkgZGVmYXVsdCBkb2VzIG5vdCBjaGFuZ2Ugbm9ybWFs
IGJlaGF2aW9yLiBXaGVuCj4+PiBkaXJ0eSB0cmFja2luZyBpcyBlbmFibGVkLCBpb21tdWZkIGNs
ZWFycyB0aGUgcHJlLXNldCBEIGJpdHMgYW5kCj4+PiBHQURFIGJlY29tZXMgbmVjZXNzYXJ5IGZv
ciBoYXJkd2FyZSB0byB1cGRhdGUgdGhlIGRpcnR5IGJpdCBvbgo+Pj4gd3JpdGUgYWNjZXNzLgo+
Pj4KPj4+IFRoaXMgYXZvaWRzIHRvZ2dsaW5nIEdBREUgZHluYW1pY2FsbHkgYW5kIGtlZXBzIGRl
dmljZSBjb250ZXh0Cj4+PiBzZXR1cCBjb25zaXN0ZW50IHdpdGggc2Vjb25kLXN0YWdlIGRvbWFp
biBhdHRhY2htZW50Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1
QGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYyB8IDIgKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMKPj4+IGluZGV4IDE2Nzc5ODc3MzUxYi4uZjAxZmQ0ZTJmODQwIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4+PiArKysgYi9kcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LmMKPj4+IEBAIC0xMzMwLDYgKzEzMzAsOCBAQCBzdGF0aWMgaW50
IHJpc2N2X2lvbW11X2F0dGFjaF9wYWdpbmdfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmlv
bW11X2RvbWFpbiwKPj4+ICAgCQkJRklFTERfUFJFUChSSVNDVl9JT01NVV9EQ19JT0hHQVRQX01P
REUsIHB0X2luZm8uaW9oZ2F0cF9tb2RlKSB8Cj4+PiAgIAkJCUZJRUxEX1BSRVAoUklTQ1ZfSU9N
TVVfRENfSU9IR0FUUF9HU0NJRCwgZG9tYWluLT5nc2NpZCkgfAo+Pj4gICAJCQlGSUVMRF9QUkVQ
KFJJU0NWX0lPTU1VX0RDX0lPSEdBVFBfUFBOLCBwdF9pbmZvLnBwbik7Cj4+PiArCQlpZiAoaW9t
bXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfQU1PX0hXQUQpCj4+PiArCQkJZGMu
dGMgfD0gUklTQ1ZfSU9NTVVfRENfVENfR0FERTsKPiAKPiBIaSBTaHVhaToKPiAKPj4KPj5JIG1p
Z2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgSSBkb24ndCBzZWUgaG93IHRoZSBHQURFIGJp
dCBzZXQKPj5oZXJlIHJlYWNoZXMgdGhlIGhhcmR3YXJlIElPTU1VIERDLiBJbiByaXNjdl9pb21t
dV9pb2Rpcl91cGRhdGUoKQo+PihpbiBwYXRjaCAwNC8xMCksIGl0IGxvb2tzIGxpa2Ugb25seSB0
aGUgViBiaXQgaXMgdGFrZW46Cj4+Cj4+CXRjID0gUkVBRF9PTkNFKGRjLT50Yyk7Cj4+CXRjIHw9
IG5ld19kYy0+dGEgJiBSSVNDVl9JT01NVV9EQ19UQ19WOwo+PgkuLi4KPj4JV1JJVEVfT05DRShk
Yy0+dGMsIHRjKTsKPj4KPiAKPiBZb3XigJlyZSByaWdodCDigJQgdGhpcyBpcyBhIHJlYWwgaXNz
dWUuCj4gCj4gR0FERSB3YXMgYmVpbmcgc2V0IGluIHRoZSBzb2Z0d2FyZS1zaWRlIGRjLCBidXQg
aXQgd2FzIG5vdAo+IHByb3BhZ2F0ZWQgaW50byB0aGUgaGFyZHdhcmUgREMgaW4gcmlzY3ZfaW9t
bXVfaW9kaXJfdXBkYXRlKCkuCj4gCj4gSSBoYXZlIGFscmVhZHkgZml4ZWQgdGhpcyBpbiBteSBs
b2NhbCB0cmVlLCBhbmQgSeKAmWxsIGluY2x1ZGUgdGhlCj4gY2hhbmdlIGluIHRoZSBuZXh0IHZl
cnNpb24gb2YgdGhlIHBhdGNoc2V0Ogo+ICAgICAgdGMgJj0gflJJU0NWX0lPTU1VX0RDX1RDX0dB
REU7Cj4gICAgICB0YyB8PSBuZXdfZGMtPnRjICYgUklTQ1ZfSU9NTVVfRENfVENfR0FERTsKPiAg
ICAgIHRjIHw9IG5ld19kYy0+dGEgJiBSSVNDVl9JT01NVV9EQ19UQ19WOwo+IAoKT25lIHRob3Vn
aHQgaGVyZSwgaW5zdGVhZCBvZiB1cGRhdGluZyBpbmRpdmlkdWFsIFRDIGJpdHMgb25lIGJ5IG9u
ZQppbiByaXNjdl9pb21tdV9pb2Rpcl91cGRhdGUoKSwgY291bGQgd2UgdHJhbnNmZXIgYWxsIHNv
ZnR3YXJlLWNvbmZpZ3VyYWJsZQpiaXRzIGZyb20gdGhlIGluY29taW5nIERDIHRvIHRoZSBoYXJk
d2FyZSBEQyBpbiBvbmUgZ28/CgpTb21ldGhpbmcgbGlrZToKCS4uLgoJdGMgPSAoUkVBRF9PTkNF
KGRjLT50YykgJiB+R0VOTUFTS19VTEwoMTEsIDApKSB8CgkJIChuZXdfZGMtPnRjICYgR0VOTUFT
S19VTEwoMTEsIDApKTsKCS4uLgoJV1JJVEVfT05DRShkYy0+dGMsIHRjKTsKCknigJltIG5vdCBz
dXJlIHdoZXRoZXIgdGhpcyBjb3VsZCBoYXZlIG5lZ2F0aXZlIHNpZGUgZWZmZWN0cy4KCj4+SSBz
YXcgdGhhdCB5b3UgbWVudGlvbmVkIHlvdSB0ZXN0ZWQgaXQgb24gUUVNVS4gQXMgZmFyIGFzIEkg
a25vdywKPj5tYWlubGluZSBRRU1VIGhhcyBub3QgeWV0IGRlY2xhcmVkIHRoZSBBTU9fSFdBRCBj
YXBhYmlsaXR5LiBDb3VsZAo+PnlvdSBjbGFyaWZ5IHdoZXRoZXIgeW91IHVzZWQgYSBtb2RpZmll
ZCBRRU1VIGZvciB0aGlzIHRlc3Q/Cj4+Cj4gCj4gSSB1c2VkIG1haW5saW5lIFFFTVUsIG5vdCBh
IG1vZGlmaWVkIG9uZS4KPiAKPiBJbiBRRU1VLCBJIG9ubHkgdGVzdGVkIHRoZSBzZWNvbmQtc3Rh
Z2UgcGF0aCB3aXRoIGEKPiBWTSB1c2luZyBkZXZpY2UgcGFzc3Rocm91Z2guCj4gCj4gSSBkaWQg
bm90IHRlc3QgdGhlIGRpcnR5LWxvZyByZWxhdGVkIHBhcnQgdGhlcmUsCj4gc28gdGhhdCBwYXRo
IGNhbm5vdCBiZSBjb3ZlcmVkIHRoZXJlLgo+IAo+IFRoYXQgaXMgd2h5IEkgbm90ZWQgaW4gdGhl
IFRPRE8gdGhhdCBJIHdpbGwgYnVpbGQgYQo+IGRlZGljYXRlZCB0ZXN0IGNhc2UgZm9yIGRpcnR5
IGxvZyBoYW5kbGluZyBsYXRlci4KClNvcnJ5LCBJIG1pc3NlZCB0aGF0IFRPRE8uCgoKVGhhbmtz
LApTaHVhaQoKPiAKPiBUaGFua3MsCj4gRmFuZ3l1Cj4gCj4+VGhhbmtzLAo+PlNodWFpCj4+Cj4+
PiAgIAl9IGVsc2Ugewo+Pj4gICAJCWlmICghcmlzY3ZfaW9tbXVfZnNjX3N1cHBvcnRlZChpb21t
dSwgcHRfaW5mby5mc2NfaW9zYXRwX21vZGUpKQo+Pj4gICAJCQlyZXR1cm4gLUVOT0RFVjsKCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
