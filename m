Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60601CD5BD0
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0p3WflCGKDzsGtrRVO1C4QO9dLLqu1XQIDtfwQVcwSU=; b=Kkxyxn7bGTQOPx
	nk/2bZ3229Jb+aSKbfW6FkF20jDlyZCc+TcXGRoEN44VV+49XisXUHMNJXi2zbnrol+YUzKl0I669
	gL08/jCBS5osYivY3d51qNuKcSmWVP4T8FCPa9osqdOdQdLqpjdRooKRdGe+UNM8zRLOcahXDIdM3
	ML0olNuCFKokkn77I025Kac73kzSIkGt2r8GE79GJye4s5swWbBy7iF7nW+ny7amkKyJ1yf/THOmu
	QNA8yVsh9JvHkxdiopZTBbTOMgSbRufrOY9q5OOw5wn96rVqolro0t6DtbupYDCcrjKDjUZfzo9Be
	IQVdg7HQMJHLi3VJ2qAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHg4-00000004YnA-2HX3;
	Wed, 27 May 2026 17:04:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHg2-00000004YmT-2MWH
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 17:04:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RARhtv1574236
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nha1feETo1rSKy37ATFEomW
	axLqzR6X6eFWdjB9xhc=; b=BEhQsBXLxYXh8B8T4cuZBzpDXJy3V8d+KSBqaJlf
	8sMlakShjajq9oljZ3x6QQUTUWxdjaS1K8zrY51pShQoNAtfCHbkF/qRVQ4806fX
	8Awxj+JRtqVusORT3KT+sztSa4ZJ2PoSXh92SrF6LKQlyhDhkCf9XIwov8+bcOb3
	t+lN4BDuP+oC99RaAC3XHQa7hX0pVxJtgMyxkU79vGGYD0FjiVv3YkvMIA+p62je
	1UPexMftSDe7A3quTUDCsQxZwKkysqk+ZtNzIxnIF0Xp4NA03HH7XflYoCUfNSgx
	ddqPAfK7LBeaGvoEanBhjSxltpWq0ekeP06TbBLuE6Gqog==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxvphh6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 17:04:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135de949041so11303403c88.0
        for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779901456; x=1780506256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=TwPdGPoil3Cf2zrQMucWAmojrbdPS0VD/XgvGy/seIbNMitZz4N9EyF3mQnWY3pLQu
         xhgz4aESQUyy7wfOtJ4AqJfrxMu3rs6/mqvfrXqY+vsGnqIupjCfXqgshkDlXiZfXCSE
         WD5OVLw1+7tN00QhLz5vfAvZ0jrYZn2uoJLpv4OyjAB04Kl9pP7NcGuZnawRIsn0Qmy7
         AFUJ4jnFTddSoCjgpP0VHRiBDtoTpTeTz4sypMsNYZhyXnacE4q2AJSzXvjRL8IBF3QT
         NJwxAN/IDEq9CykeobxG8HeT+FXG4w1hLJEmIwkLgIB8mJMEnG9gVg3hCKX89WkQ2Jd1
         GooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901456; x=1780506256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=SH+eEWG0NlWjHVDZK9zA8YxMqknqsHLBccVY55Z5eIlsMNmtpiYnUPP7jVsNR5NvHD
         ilnNZk3D+YgPIz1sMwgLveL1dPYm5X/I0HSeDvf2rFj1fpEM37bzh/q0Hdkm6t3mVt3t
         qhV1grtM1N11jz+F/jE8/Gyy3uiACwPE4rPijNVRGYsl0nkj+IgiR8j5rBH8H4qEkaE8
         Hpw5F7TxuTDwIAn3f2qaZOjyrikxiZBv7OksG7CUnGKfhqXnFO7eK9AjxlrYAkM5dNZk
         XYp81/UX+BkYNf1dcKniaqyk7X0ak29N1kvddWK4NaK7YkFqXqeUsAWfC7mnZVATPHg0
         VcpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K4WALdrQQUU9jW9GHOnLHTevVABZy011Z2D4RRFv9jXudLNRFVGRNath4XznAnhy/bhW/slxiLhw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQBjE/uHsNWwW4yjY3vZDdqzRXV22OJ0hA9TDVQyYwuynMzDPl
	D6+eK1Cd81HWqGomEVUy5nbzeIqLAtV45nOQIvekaBStIpDrGmqqGSjm5wHbu2AdzIR6P7okSvR
	0w/WePVQy5CzHmLkWjmZd3wwtuZ4RtZKtnWK3man/1gra7hn/fJkn1KoAbsOHKpKN2wZ5
X-Gm-Gg: Acq92OEAFCqmalyQoNnzRvOydZd6toFX8usJiBSsc3rIqS8Aww262YMUkJxg5LlxCMv
	Jipb00AN41+fY4VawkMGAlQEslkVc731/y1pZs9697TDtfmK9hVETuS47IQzq5skQsHVr+FcBdf
	20W1n0PmGDvWAYOiD0PIHxPW8xrDyuHGloULSlmS63OZ2xXAISYlROgYec6aMvuVk4YssGmL4my
	4ktDsyaowvc4tOYbNj+pH+al25PCWTY+PeBjSAo5PzZtma+8bx103ajFiLzXhfcxmq0rebvBPL8
	E2fLwTYgSYv9f6EMnCWm32qA6gPSePWuNcLnpqf6+UPKC/gDnajCU5esv6TfIiOfJIU95EUI7Xu
	U629UQ0KMTHTL+dNfFRTVKqHrmRvWLLvUs3loc1lp1Q==
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719568c88.25.1779901455911;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719548c88.25.1779901455346;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88eccsm10819104c88.9.2026.05.27.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:04:14 -0700 (PDT)
Date: Wed, 27 May 2026 12:04:13 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <bfap4hslksgmfosoy2c4g5qgrhk6ofd72e6f3f2qxpojey5yuc@74jvqlfe3urw>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE3MSBTYWx0ZWRfX1Wn4MtrMC3nu
 8AQHLx/fgAJV4hkjO39dg6LteUiwceVQR2nPkJ0xkC0HcgVHCnyUjlTIFqwEL8X8kGia/rr+FeS
 ClCuZaNowLtGFNtV0CRXqNP3ELacaYQyuLTt4JVghoKyZtcOxlHCf72rVB9sFvdGw0bhRNKY/zP
 ZXG2sCFLn1PrS98JVmuEBicm74kFEsiwrojAXw2sfEHq/mu+pR6x9DbrlfbirYEjbcCDxsXto1g
 eYvv70Rb8efgcGAZkgcQHwt4IFP+RxH7RRJzDdgqNbFTzYKA0kst0SSIF7ElMe2D/BeZGflS4Kk
 HCwXarWOoeYZaDETKVtuGve4GX06DdIDX0RThzj8ALPHFPxGEXZJjvuJ04/g/txfm/cQOiIborf
 jGXrUMH5wpFzvGbfw7ZiLtYy7I4gtn/Dww2jYPI6hsHtxiieiG4PO5CC2moXmVkMGRt6bXUUKzE
 QQew/TLVcG4cqFSLQaw==
X-Proofpoint-GUID: xqFuHGG1Y5q3Zv2gTamIwvB1pCVLmljp
X-Proofpoint-ORIG-GUID: xqFuHGG1Y5q3Zv2gTamIwvB1pCVLmljp
X-Authority-Analysis: v=2.4 cv=VqoTxe2n c=1 sm=1 tr=0 ts=6a172410 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DOyYl3NULbmlVlinG0MA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_100418_718414_54B86C7F 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
...
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||

The only mandated RVA23U64 extension we don't have ISA string support for
is Zic64b. I wonder if we shouldn't add that support too where it would
have a validate check like above.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
