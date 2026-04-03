Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C048CE85379
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp/MZlHcemh87cMloPfyFpzJxXlLsKdZG1qI60gIBDg=; b=egeWdSNqSd90H6
	qLL2nl3TGC/y62KYAKgQ+Bz6eV41bfDLA/8rUJ4Yl4OtbiS3x/Vl6Dx1IfDIpuGEaA99ZNT8dIZps
	ipkd5jJYzeWmItHNslTh84x2SMuqvftk8opc0xblUCtGqohtrSf4G4vc2CzPxnANQIgkn4npEI5BY
	+HD9hWhYPLaUD2tKHssL0pO0VT7xYqXpNVYLPqQ9BBJW3NoSvSqB1PwjTpV5zC5vptbm44ZQM2MYN
	g19lY2Q7rwnZKJKDt8puQutN67aeJe+g0qYJ70NHaaHs2xQ8mlAuFKKE/KtrIYNHPJQuE9a/rmyXI
	qzQr+rl1EflTOxcyploA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hbb-00000002LOe-1Upz;
	Fri, 03 Apr 2026 16:42:47 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hbX-00000002LNs-49YY
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 16:42:45 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6830f4f34c9so189673eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234563; cv=none;
        d=google.com; s=arc-20240605;
        b=IWI/0p+6iVo979QflmvxL4QbDfQDC8lTaKh4aWefXEHL1QWxxjF2qjfrRn8mml4lSb
         jY+uwGasPgP5g4RefPbnO0M1XUGLWyAxLpscfGtofgcJpUbd7JlfGrS3vziBS/THMwTW
         aAtY9tAVVXb1dKJXguScuCPjwTYUiIWOl6vDsGbo7Xic6dtUCL+ZKB9yjzeoW7f0iNMb
         K/SWl6jjBGb6yql7PvO6NOgpRAzLfzLxltXHd2QalmIH8VMD8vxVYaXcCVO8RChSbrWS
         eH/j74buI3z72x5M7JxBQcjluYUEjn3zyM1/cLBj6so9hGSOb4skw7RxGCBq30M4Fh3L
         d0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        fh=O0iuXn1nUPC4G4nrX4PrWTm/gQiBO5tTUGcxXANSjEI=;
        b=UNVdgkqEQjkb1jI4QbZAoNrK96H8CmAsIyeWVf6VZj9oqtN+HNvbldgi27oc13lmOu
         ESNNRNCjQfw/roMhqayZeNoHHhqKRUqqMAQyIVrYhQtYGWX2xAcat0lg7fUwOkbkt+n6
         MMrGxYk0o1RFJzug9/E5ynpwjqCInfxQB95tRDc4v0DEPGz/CbDexsvYjbCSXJt6+cAw
         m1hn1wqwSRMUug8xwnHow/qvWf9GD6VFsi9CR1oZ6Bwgr/pqug7K1nnGDtjFW4V4w6m8
         vc99BxfqziAhOxGkxtFkvJd018Rfc05p78z83fYdygb4yriegkbkCc7JNpNmdhblGXQI
         EVDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775234563; x=1775839363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        b=lR9GrX+ZmqjYyVDVWmdFVfrVkO34GaXrxZ2ESMHvQ7z71ElJkRoEOCYFl8E0tUOhAT
         ekBAfW3OoWbT/fCNDt/+aK3t+aL+Ek5mpnbQOGHz/JZQeCOlPNvHESJuMd+uf5fiiNNd
         mHjOfwcpUwIhHCoTBkvqG1UN43KxOD73JabKW4jm51fAkScl5v1wR37Mz9wnRmuH5dcz
         /h+AfnEUTWKHYjrF5PDqGno3inQ1FoJfDMht/8qMjD0Q/9fDgGbdXbxIGI98SgMJcoBT
         VhJdOT+v9uZwL2v3iy+5jNjBA58ruvZR0MfrMrWBFqXCgDMWwZAWGzgLCASSlPUlO0iR
         /IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234563; x=1775839363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        b=Eg5lCyKeflP3yJt6C/hhst5RQjBgP6yxQCg6UylZtx5nHXIzSDJjANSo/KwqVg4sh3
         t8B6sqbdZThwMe3xHV8iYosD9Dc9sAxiAKFlCQhJ+SrkrZEgDUjteEvAJ9KBIY4V4m9E
         0G/MBtuk5rtszIwKTFo8Vjh/BzOAPK+MBvecinv0x1gGjr4JXS2DuY2RXD0mgoGNQT5K
         r40CGhzHTBy5z9VW9zLqp7XdhhhaE4Df3ZOaT/RNuS50nEOcUV8nsKV6f8mHYeMr9QEJ
         wKvqtVxwkEW4MX3OOzHaNqinhygNnD5twC21jE6Ud0KNHSU2qE+NvNYoMfDaIYlSbAWD
         D4LA==
X-Forwarded-Encrypted: i=1; AJvYcCVcCvDNWMBTRFSU4XKuxUVMokF/S/HPeebSmu1ww9ns+A/5E7QF2VPYZ/Uh7vpkUqfyw6oKNIRBOTU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99zCl/WGzE8RfZdNXd56bkUfrpetkiQICT20moiMdrmUNpS35
	Cg3YBoQDv2SSZkrHTDCAY0ZfZXqNapWE3BeueKukiwfgMX10G3P325uvGxy5rnAsyqF/UMur1DP
	hQDsanAnJlU1hvBabNiL4mSZkHGlAFUCQ17TEKuS2sg==
X-Gm-Gg: ATEYQzxrTp+UsJuemUhet3WNh+3+dm5KAd0doM60oTgAaZS8BHJ/N0FyudWNeR3ifh6
	I4Bi59XKVcmAgZvN9iYRjAkRIGSlkq8u4c1Gv4L7OIxlJABlnDvP+sil9+3tZMc+O8eryYyKvIH
	plO2nSHI2Dxo4FNLinQf2LQzo3YEBzagFy1LPjsX2jDOMw3c+R7e6yoIYIF6VQTkuS+N3W9w5Bq
	6rEZMp9xvaXJPCqrVyy/oUXJF6O4FYhSTU1Jg2uwa2UxNH6CeSaRNLpiP5BKKcN6TGRsAiMDksa
	TXeJJ4o+Zxp/YHlkcKrm8R2ppR90j5bAbLbtb/1RG0UIGDf5RA+J3coX3636t9OVvvMp9uS7mMw
	JIhS5asfxPJSPE7zIHxklFxnk9g==
X-Received: by 2002:a05:6820:2215:b0:67e:42ca:bf1 with SMTP id
 006d021491bc7-6821fe62163mr1788720eaf.35.1775234562721; Fri, 03 Apr 2026
 09:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com> <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 22:12:31 +0530
X-Gm-Features: AQROBzCuQ5MlY1qXpbAGUgE7OvJH7RKCeYopTbo-0zq1mBL8wwRCkjds0LobFsM
Message-ID: <CAAhSdy30Eg1GvnyfJyqABLEyP9_rV3Zb=Ts5TAxWWnv0frWRYA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_094244_164520_00B46DAE 
X-CRM114-Status: GOOD (  18.48  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA5OjAw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IFJldXNlIEtWTV9DQVBfVk1fR1BBX0JJVFMgdG8gYWR2ZXJ0aXNlIGFuZCBzZWxl
Y3QgdGhlIGVmZmVjdGl2ZQo+IEctc3RhZ2UgR1BBIHdpZHRoIGZvciBhIFZNLgo+Cj4gS1ZNX0NI
RUNLX0VYVEVOU0lPTihLVk1fQ0FQX1ZNX0dQQV9CSVRTKSByZXR1cm5zIHRoZSBlZmZlY3RpdmUg
R1BBCj4gYml0cyBmb3IgYSBWTSwgS1ZNX0VOQUJMRV9DQVAoS1ZNX0NBUF9WTV9HUEFfQklUUykg
YWxsb3dzIHVzZXJzcGFjZQo+IHRvIGRvd25zaXplIHRoZSBlZmZlY3RpdmUgR1BBIHdpZHRoIGJ5
IHNlbGVjdGluZyBhIHNtYWxsZXIgRy1zdGFnZQo+IHBhZ2UgdGFibGUgZm9ybWF0Ogo+ICAgLSBn
cGFfYml0cyA8PSA0MSBzZWxlY3RzIFN2Mzl4NCAocGdkX2xldmVscz0zKQo+ICAgLSBncGFfYml0
cyA8PSA1MCBzZWxlY3RzIFN2NDh4NCAocGdkX2xldmVscz00KQo+ICAgLSBncGFfYml0cyA8PSA1
OSBzZWxlY3RzIFN2NTd4NCAocGdkX2xldmVscz01KQo+Cj4gUmVqZWN0IHRoZSByZXF1ZXN0IHdp
dGggLUVJTlZBTCBmb3IgdW5zdXBwb3J0ZWQgdmFsdWVzIGFuZCB3aXRoIC1FQlVTWQo+IGlmIHZD
UFVzIGhhdmUgYmVlbiBjcmVhdGVkIG9yIGFueSBtZW1zbG90IGlzIHBvcHVsYXRlZC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+
IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCkxHVE0uCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAt
LS0KPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMgYi9hcmNo
L3Jpc2N2L2t2bS92bS5jCj4gaW5kZXggZmI3YzRlMDc5NjFmLi5hOWYwODNmZWViNzYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMK
PiBAQCAtMjE0LDEyICsyMTQsNTIgQEAgaW50IGt2bV92bV9pb2N0bF9jaGVja19leHRlbnNpb24o
c3RydWN0IGt2bSAqa3ZtLCBsb25nIGV4dCkKPgo+ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9j
YXAoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2VuYWJsZV9jYXAgKmNhcCkKPiAgewo+ICsg
ICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICsKPiAgICAgICAgIHN3aXRjaCAoY2FwLT5jYXApIHsKPiAgICAgICAgIGNhc2UgS1ZNX0NBUF9S
SVNDVl9NUF9TVEFURV9SRVNFVDoKPiAtICAgICAgICAgICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAg
IGt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICsgICAgICAgY2FzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTOiB7Cj4gKyAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZ3BhX2JpdHMgPSBjYXAtPmFyZ3NbMF07Cj4gKyAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbmV3X2xldmVsczsKPiArICAgICAgICAgICAgICAgaW50IHIgPSAw
Owo+ICsKPiArICAgICAgICAgICAgICAgLyogRGVjaWRlIHRhcmdldCBwZ2QgbGV2ZWxzIGZyb20g
cmVxdWVzdGVkIGdwYV9iaXRzICovCj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiArICAgICAgICAg
ICAgICAgaWYgKGdwYV9iaXRzIDw9IDQxKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5ld19s
ZXZlbHMgPSAzOyAgICAgICAgLyogU3YzOXg0ICovCj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYg
KGdwYV9iaXRzIDw9IDUwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5ld19sZXZlbHMgPSA0
OyAgICAgICAgLyogU3Y0OHg0ICovCj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKGdwYV9iaXRz
IDw9IDU5KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5ld19sZXZlbHMgPSA1OyAgICAgICAg
LyogU3Y1N3g0ICovCj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiArI2Vsc2UKPiArICAgICAgICAgICAgICAgLyogMzItYml0
OiBvbmx5IFN2MzJ4NCovCj4gKyAgICAgICAgICAgICAgIGlmIChncGFfYml0cyA8PSAzNCkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBuZXdfbGV2ZWxzID0gMjsKPiArICAgICAgICAgICAgICAg
ZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsjZW5kaWYK
PiArICAgICAgICAgICAgICAgaWYgKG5ld19sZXZlbHMgPiBrdm1fcmlzY3ZfZ3N0YWdlX21heF9w
Z2RfbGV2ZWxzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsK
PiArICAgICAgICAgICAgICAgLyogRm9sbG93IEtWTSdzIGxvY2sgb3JkZXJpbmc6IGt2bS0+bG9j
ayAtPiBrdm0tPnNsb3RzX2xvY2suICovCj4gKyAgICAgICAgICAgICAgIG11dGV4X2xvY2soJmt2
bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIG11dGV4X2xvY2soJmt2bS0+c2xvdHNfbG9jayk7
Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtLT5jcmVhdGVkX3ZjcHVzIHx8ICFrdm1fYXJl
X2FsbF9tZW1zbG90c19lbXB0eShrdm0pKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHIgPSAt
RUJVU1k7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICBr
dm0tPmFyY2gucGdkX2xldmVscyA9IG5ld19sZXZlbHM7Cj4gKwo+ICsgICAgICAgICAgICAgICBt
dXRleF91bmxvY2soJmt2bS0+c2xvdHNfbG9jayk7Cj4gKyAgICAgICAgICAgICAgIG11dGV4X3Vu
bG9jaygma3ZtLT5sb2NrKTsKPiArCj4gKyAgICAgICAgICAgICAgIHJldHVybiByOwo+ICsgICAg
ICAgfQo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gICAgICAgICB9Cj4gLS0KPiAyLjUwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
